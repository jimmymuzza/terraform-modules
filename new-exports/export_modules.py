#!/usr/bin/env python3
"""
export_modules.py

Auto-generate Terraform/OpenTofu wrapper modules for every resource type in a
provider. Modules that already exist on disk are skipped (all 4 files present).
The latest provider version is fetched automatically unless a version is pinned.

Batch mode (reads providers.json):
    python3 export_modules.py

Single provider mode:
    python3 export_modules.py azurerm
    python3 export_modules.py aws --version 6.33.0 --tool tofu
    python3 export_modules.py azurerm --namespace hashicorp --output ../new-exports

providers.json format (searched in the same directory as this script):
    {
        "default_tool": "terraform",
        "output_dir": "new-exports",
        "providers": [
            {"provider": "azurerm", "namespace": "hashicorp"},
            {"provider": "aws", "namespace": "hashicorp", "version": "6.33.0"}
        ]
    }
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path

# ── Registry base URLs ────────────────────────────────────────────────────────
REGISTRIES = {
    "terraform": "registry.terraform.io",
    "tofu": "registry.opentofu.org",
}

# Block type names that are framework-level and not user-facing attributes
SKIP_BLOCK_TYPES = {"timeouts"}

# The four files that constitute a complete module
MODULE_FILES = {"main.tf", "variables.tf", "outputs.tf", "versions.tf"}

# Path of this script (used to find providers.json)
SCRIPT_DIR = Path(__file__).resolve().parent


# ── Helpers ───────────────────────────────────────────────────────────────────

def die(msg: str) -> None:
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def log(msg: str) -> None:
    print(msg)


def fetch_json(url: str) -> dict:
    try:
        req = urllib.request.Request(url, headers={"User-Agent": "export-modules/1.0"})
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        die(f"HTTP {e.code} fetching {url}: {e.reason}")
    except Exception as e:
        die(f"Failed to fetch {url}: {e}")


def get_latest_version(tool: str, namespace: str, provider: str) -> str:
    registry = REGISTRIES[tool]
    url = f"https://{registry}/v1/providers/{namespace}/{provider}/versions"
    log(f"  Fetching version list from {url} ...")
    data = fetch_json(url)
    versions = [v["version"] for v in data.get("versions", [])]
    if not versions:
        die(f"No versions found for {namespace}/{provider} on {registry}")

    def semver_key(v: str) -> tuple:
        try:
            return tuple(int(x) for x in v.split("."))
        except ValueError:
            return (0, 0, 0)

    versions.sort(key=semver_key, reverse=True)
    return versions[0]


def detect_tool() -> str:
    """Return the first available tool: terraform, then tofu. Dies if neither found."""
    for tool in ("terraform", "tofu"):
        if shutil.which(tool):
            return tool
    die(
        "Neither 'terraform' nor 'tofu' found in PATH.\n"
        "Install Terraform (https://developer.hashicorp.com/terraform/install) or "
        "OpenTofu (https://opentofu.org/docs/intro/install/) and try again."
    )


# ── Pluralisation ─────────────────────────────────────────────────────────────

def pluralise(word: str) -> str:
    """Pluralise the last segment of a snake_case identifier using basic English rules."""
    parts = word.split("_")
    last = parts[-1]
    if last.endswith("y") and len(last) > 1 and last[-2] not in "aeiou":
        last = last[:-1] + "ies"
    elif last.endswith(("sh", "ch", "ss", "x", "z")):
        last += "es"
    elif last.endswith("s"):
        pass  # already ends in s; leave it
    else:
        last += "s"
    parts[-1] = last
    return "_".join(parts)


# ── HCL type conversion ───────────────────────────────────────────────────────

def tf_type_to_hcl(t, depth: int = 0) -> str:
    """Recursively convert a Terraform schema type value to an HCL type expression."""
    pad = "    " * depth
    inner_pad = "    " * (depth + 1)

    if isinstance(t, str):
        return t if t in ("string", "number", "bool") else "any"

    if not isinstance(t, list) or len(t) != 2:
        return "any"

    kind, inner = t
    if kind == "list":
        return f"list({tf_type_to_hcl(inner, depth)})"
    if kind == "set":
        return f"set({tf_type_to_hcl(inner, depth)})"
    if kind == "map":
        return f"map({tf_type_to_hcl(inner, depth)})"
    if kind == "object" and isinstance(inner, dict):
        if not inner:
            return "object({})"
        fields = "\n".join(
            f"{inner_pad}{k} = {tf_type_to_hcl(v, depth + 1)}"
            for k, v in sorted(inner.items())
        )
        return f"object({{\n{fields}\n{pad}}})"
    if kind == "tuple":
        return "list(any)"
    return "any"


# ── Schema attribute helpers ──────────────────────────────────────────────────

def is_settable(attr: dict) -> bool:
    """True if the attribute should appear in variables.tf and main.tf.

    Purely computed attributes (like 'id') are read-only and should be skipped.
    Attributes that are both optional and computed are still user-settable.
    """
    computed_only = (
        attr.get("computed", False)
        and not attr.get("optional", False)
        and not attr.get("required", False)
    )
    return not computed_only


def collect_attrs(block: dict) -> tuple[dict, dict]:
    """Return (required_attrs, optional_attrs) dicts from a schema block."""
    req: dict = {}
    opt: dict = {}
    for name, attr in sorted(block.get("attributes", {}).items()):
        if name == "id" or not is_settable(attr):
            continue
        if attr.get("required", False):
            req[name] = attr
        else:
            opt[name] = attr
    return req, opt


def block_type_to_hcl(bt: dict, depth: int) -> tuple[str, bool]:
    """Return (hcl_type_string, is_required) for a block_type entry.

    Used inside the variables.tf object({...}) type definition.
    Recurses into nested block_types.
    """
    pad = "    " * depth
    inner_pad = "    " * (depth + 1)
    mode = bt.get("nesting_mode", "list")
    min_items = bt.get("min_items", 0)
    required = bool(min_items and min_items > 0)
    inner_block = bt["block"]

    lines: list[str] = []
    req_attrs, opt_attrs = collect_attrs(inner_block)

    for name, attr in req_attrs.items():
        hcl_t = tf_type_to_hcl(attr.get("type", "any"), depth + 1)
        lines.append(f"{inner_pad}{name} = {hcl_t}")

    for name, attr in opt_attrs.items():
        hcl_t = tf_type_to_hcl(attr.get("type", "any"), depth + 1)
        lines.append(f"{inner_pad}{name} = optional({hcl_t})")

    for nested_name, nested_bt in sorted(inner_block.get("block_types", {}).items()):
        if nested_name in SKIP_BLOCK_TYPES:
            continue
        nested_hcl, nested_req = block_type_to_hcl(nested_bt, depth + 1)
        if nested_req:
            lines.append(f"{inner_pad}{nested_name} = {nested_hcl}")
        else:
            lines.append(f"{inner_pad}{nested_name} = optional({nested_hcl})")

    inner_str = "\n".join(lines)
    obj_str = f"object({{\n{inner_str}\n{pad}}})"

    if mode == "single":
        container = obj_str
    elif mode == "map":
        container = f"map({obj_str})"
    else:  # list or set
        container = f"list({obj_str})"

    return container, required


# ── File generators ───────────────────────────────────────────────────────────

def generate_variables_tf(resource_type: str, var_name: str, block: dict) -> str:
    req_attrs, opt_attrs = collect_attrs(block)
    block_types = block.get("block_types", {})

    req_bt_names: list[str] = []
    opt_bt_names: list[str] = []
    for bt_name, bt in sorted(block_types.items()):
        if bt_name in SKIP_BLOCK_TYPES:
            continue
        _, is_req = block_type_to_hcl(bt, depth=2)
        (req_bt_names if is_req else opt_bt_names).append(bt_name)

    # ── Description heredoc ──
    desc_lines = [f"Map of {var_name}, attributes below"]
    if req_attrs or req_bt_names:
        desc_lines.append("Required:")
        for n in req_attrs:
            desc_lines.append(f"    - {n}")
        for n in req_bt_names:
            desc_lines.append(f"    - {n}")
    if opt_attrs or opt_bt_names:
        desc_lines.append("Optional:")
        for n in opt_attrs:
            desc_lines.append(f"    - {n}")
        for n in opt_bt_names:
            desc_lines.append(f"    - {n}")
    description = "\n".join(desc_lines)

    # ── Type body ──
    type_lines: list[str] = []
    for name, attr in req_attrs.items():
        hcl_t = tf_type_to_hcl(attr.get("type", "any"), depth=2)
        type_lines.append(f"    {name} = {hcl_t}")
    for name, attr in opt_attrs.items():
        hcl_t = tf_type_to_hcl(attr.get("type", "any"), depth=2)
        type_lines.append(f"    {name} = optional({hcl_t})")
    for bt_name, bt in sorted(block_types.items()):
        if bt_name in SKIP_BLOCK_TYPES:
            continue
        hcl_t, is_req = block_type_to_hcl(bt, depth=2)
        if is_req:
            type_lines.append(f"    {bt_name} = {hcl_t}")
        else:
            type_lines.append(f"    {bt_name} = optional({hcl_t})")

    type_body = "\n".join(type_lines)

    return (
        f'variable "{var_name}" {{\n'
        f"  description = <<EOT\n"
        f"{description}\n"
        f"EOT\n"
        f"\n"
        f"  type = map(object({{\n"
        f"{type_body}\n"
        f"  }}))\n"
        f"}}\n"
    )


def _dynamic_block(bt_name: str, bt: dict, indent: int) -> list[str]:
    """Return lines for a dynamic block, recursing into nested block_types."""
    pad = " " * indent
    mode = bt.get("nesting_mode", "list")
    inner_block = bt["block"]
    req_attrs, opt_attrs = collect_attrs(inner_block)
    inner_all = {**req_attrs, **opt_attrs}
    inner_bts = {
        k: v
        for k, v in inner_block.get("block_types", {}).items()
        if k not in SKIP_BLOCK_TYPES
    }
    inner_max = max((len(n) for n in inner_all), default=0)

    if mode == "single":
        fe = f"each.value.{bt_name} != null ? [each.value.{bt_name}] : []"
    elif mode == "map":
        fe = f"each.value.{bt_name} != null ? each.value.{bt_name} : {{}}"
    else:  # list, set
        fe = f"each.value.{bt_name} != null ? each.value.{bt_name} : []"

    lines: list[str] = [
        "",
        f'{pad}dynamic "{bt_name}" {{',
        f"{pad}  for_each = {fe}",
        f"{pad}  content {{",
    ]
    for name in inner_all:
        apad = " " * (inner_max - len(name) + 1)
        lines.append(f"{pad}    {name}{apad}= {bt_name}.value.{name}")

    # Nested dynamic blocks (one level deeper)
    for nested_name, nested_bt in sorted(inner_bts.items()):
        nested_mode = nested_bt.get("nesting_mode", "list")
        nested_req, nested_opt = collect_attrs(nested_bt["block"])
        nested_all = {**nested_req, **nested_opt}
        nested_max = max((len(n) for n in nested_all), default=0)

        if nested_mode == "single":
            nfe = (
                f"{bt_name}.value.{nested_name} != null"
                f" ? [{bt_name}.value.{nested_name}] : []"
            )
        elif nested_mode == "map":
            nfe = (
                f"{bt_name}.value.{nested_name} != null"
                f" ? {bt_name}.value.{nested_name} : {{}}"
            )
        else:
            nfe = (
                f"{bt_name}.value.{nested_name} != null"
                f" ? {bt_name}.value.{nested_name} : []"
            )

        lines.extend(
            [
                "",
                f'{pad}    dynamic "{nested_name}" {{',
                f"{pad}      for_each = {nfe}",
                f"{pad}      content {{",
            ]
        )
        for name in nested_all:
            apad = " " * (nested_max - len(name) + 1)
            lines.append(f"{pad}        {name}{apad}= {nested_name}.value.{name}")
        lines.extend([f"{pad}      }}", f"{pad}    }}"])

    lines.extend([f"{pad}  }}", f"{pad}}}"])
    return lines


def generate_main_tf(resource_type: str, var_name: str, block: dict) -> str:
    req_attrs, opt_attrs = collect_attrs(block)
    all_attrs = {**req_attrs, **opt_attrs}
    block_types = {
        k: v
        for k, v in block.get("block_types", {}).items()
        if k not in SKIP_BLOCK_TYPES
    }

    max_len = max((len(n) for n in all_attrs), default=0)

    lines: list[str] = [
        f'resource "{resource_type}" "{var_name}" {{',
        f"  for_each = var.{var_name}",
        "",
    ]

    for name in all_attrs:
        apad = " " * (max_len - len(name) + 1)
        lines.append(f"  {name}{apad}= each.value.{name}")

    for bt_name, bt in sorted(block_types.items()):
        lines.extend(_dynamic_block(bt_name, bt, indent=2))

    lines.extend(["}", ""])
    return "\n".join(lines)


def generate_outputs_tf(resource_type: str, var_name: str, base: str) -> str:
    return (
        f'output "{var_name}" {{\n'
        f'  description = "All {base} resources"\n'
        f"  value       = {resource_type}.{var_name}\n"
        f"}}\n"
    )


def generate_versions_tf(namespace: str, provider: str, version: str) -> str:
    # Use shorthand source (compatible with both Terraform and OpenTofu registries)
    return (
        f"terraform {{\n"
        f"  required_providers {{\n"
        f"    {provider} = {{\n"
        f'      source  = "{namespace}/{provider}"\n'
        f'      version = "~> {version}"\n'
        f"    }}\n"
        f"  }}\n"
        f"}}\n"
    )


# ── Schema download ───────────────────────────────────────────────────────────

def fetch_schema(tool: str, namespace: str, provider: str, version: str) -> dict:
    """Download the provider via init and extract its full schema JSON.

    Creates a temporary directory, writes a minimal versions.tf, runs init to
    download the provider binary, then runs providers schema -json. Cleans up
    the temp dir on exit.
    """
    registry = REGISTRIES[tool]
    source = f"{registry}/{namespace}/{provider}"

    tmp = Path(tempfile.mkdtemp(prefix="tf-schema-"))
    try:
        log(f"  Initialising provider {source}@{version} ...")

        (tmp / "versions.tf").write_text(
            f"terraform {{\n"
            f"  required_providers {{\n"
            f"    {provider} = {{\n"
            f'      source  = "{source}"\n'
            f'      version = "= {version}"\n'
            f"    }}\n"
            f"  }}\n"
            f"}}\n"
        )

        env = {**os.environ, "TF_INPUT": "0", "TF_IN_AUTOMATION": "1"}

        result = subprocess.run(
            [tool, "init", "-input=false", "-no-color", "-backend=false"],
            cwd=tmp,
            capture_output=True,
            text=True,
            env=env,
        )
        if result.returncode != 0:
            die(f"{tool} init failed:\n{result.stdout}\n{result.stderr}")

        log(f"  Extracting schema ...")
        result = subprocess.run(
            [tool, "providers", "schema", "-json"],
            cwd=tmp,
            capture_output=True,
            text=True,
            env=env,
        )
        if result.returncode != 0:
            die(f"{tool} providers schema failed:\n{result.stdout}\n{result.stderr}")

        return json.loads(result.stdout)
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


# ── Module existence check ────────────────────────────────────────────────────

def module_exists(module_dir: Path) -> bool:
    """Return True if all 4 module files already exist."""
    return all((module_dir / f).exists() for f in MODULE_FILES)


# ── Core: generate modules for one provider ───────────────────────────────────

def process_provider(
    provider: str,
    namespace: str,
    version: str | None,
    tool: str,
    output_root: Path,
) -> None:
    log(f"\n{'='*60}")
    log(f"Provider : {namespace}/{provider}")
    log(f"Tool     : {tool}")

    if version:
        log(f"Version  : {version} (pinned)")
    else:
        version = get_latest_version(tool, namespace, provider)
        log(f"Version  : {version} (latest)")

    out_dir = output_root / "terraform" / provider / version
    log(f"Output   : {out_dir}")

    schema = fetch_schema(tool, namespace, provider, version)

    # Locate the provider schema block (key varies by tool/registry)
    provider_schemas = schema.get("provider_schemas", {})
    if not provider_schemas:
        die("No provider_schemas in schema output")

    schema_key = next((k for k in provider_schemas if provider in k), None)
    if not schema_key:
        die(
            f"Could not find '{provider}' in schema keys: {list(provider_schemas)}"
        )

    resource_schemas = provider_schemas[schema_key].get("resource_schemas", {})
    log(f"Resources: {len(resource_schemas)} types found")

    new_count = skip_count = 0
    provider_prefix = provider + "_"

    for resource_type, resource_schema in sorted(resource_schemas.items()):
        module_dir = out_dir / resource_type

        if module_exists(module_dir):
            skip_count += 1
            continue

        # Strip provider prefix then pluralise for the variable/output name
        base = (
            resource_type[len(provider_prefix):]
            if resource_type.startswith(provider_prefix)
            else resource_type
        )
        var_name = pluralise(base)
        block = resource_schema.get("block", {})

        module_dir.mkdir(parents=True, exist_ok=True)
        (module_dir / "main.tf").write_text(
            generate_main_tf(resource_type, var_name, block)
        )
        (module_dir / "variables.tf").write_text(
            generate_variables_tf(resource_type, var_name, block)
        )
        (module_dir / "outputs.tf").write_text(
            generate_outputs_tf(resource_type, var_name, base)
        )
        (module_dir / "versions.tf").write_text(
            generate_versions_tf(namespace, provider, version)
        )

        log(f"  + {resource_type}  →  {var_name}")
        new_count += 1

    log(f"  Generated {new_count}, skipped {skip_count} (already exist)")


# ── Entry point ───────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Auto-generate Terraform/OpenTofu wrapper modules from provider schemas.\n"
            "Run without arguments to process all providers in providers.json."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "provider",
        nargs="?",
        help="Provider name (e.g. azurerm, aws). Omit to use providers.json.",
    )
    parser.add_argument("--namespace", default="hashicorp", help="Provider namespace")
    parser.add_argument(
        "--version",
        default=None,
        help="Provider version (default: fetch latest)",
    )
    parser.add_argument(
        "--tool",
        choices=["terraform", "tofu"],
        default=None,
        help="CLI tool to use (default: auto-detect terraform then tofu)",
    )
    parser.add_argument(
        "--output",
        default=None,
        help="Output root directory (default: directory containing this script)",
    )
    args = parser.parse_args()

    # ── Single-provider mode ──────────────────────────────────────────────────
    if args.provider:
        tool = args.tool or detect_tool()
        output_root = Path(args.output) if args.output else SCRIPT_DIR
        process_provider(
            provider=args.provider,
            namespace=args.namespace,
            version=args.version,
            tool=tool,
            output_root=output_root,
        )
        return

    # ── Batch mode: read providers.json ──────────────────────────────────────
    config_path = SCRIPT_DIR / "providers.json"
    if not config_path.exists():
        die(
            f"No provider specified and {config_path} not found.\n"
            f"Usage: python3 export_modules.py <provider>  OR  create providers.json"
        )

    with open(config_path) as f:
        config = json.load(f)

    default_tool = args.tool or config.get("default_tool") or detect_tool()
    output_dir = args.output or config.get("output_dir")
    output_root = (SCRIPT_DIR / output_dir) if output_dir else SCRIPT_DIR

    providers = config.get("providers", [])
    if not providers:
        die("providers.json has an empty 'providers' list")

    log(f"Batch mode: {len(providers)} provider(s) to process")

    for entry in providers:
        process_provider(
            provider=entry["provider"],
            namespace=entry.get("namespace", "hashicorp"),
            version=entry.get("version"),  # None → fetch latest
            tool=entry.get("tool", default_tool),
            output_root=output_root,
        )

    log("\nAll providers complete.")


if __name__ == "__main__":
    main()
