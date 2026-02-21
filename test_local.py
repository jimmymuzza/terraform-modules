#!/usr/bin/env python3
"""
test_local.py

Standalone test script. Run from the repo root:
    python3 test_local.py

Steps:
  1. Installs OpenTofu locally (~/.tofu-bin/) if not already in PATH
  2. Resolves the latest azurerm provider version from registry.opentofu.org
  3. Downloads the provider schema via `tofu init` + `tofu providers schema -json`
  4. Generates modules for three resource types only:
       - azurerm_resource_group
       - azurerm_management_group
       - azurerm_subscription

Output: ./test-output/azurerm/<version>/<resource_type>/  (4 files each)
"""

import json
import os
import platform
import shutil
import stat
import subprocess
import sys
import tempfile
import urllib.request
import zipfile
from pathlib import Path

# ── Config ────────────────────────────────────────────────────────────────────

RESOURCE_TYPES = [
    "azurerm_resource_group",
    "azurerm_management_group",
    "azurerm_subscription",
]

PROVIDER   = "azurerm"
NAMESPACE  = "hashicorp"
REGISTRY   = "registry.opentofu.org"

SCRIPT_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = SCRIPT_DIR / "test-output"
BIN_DIR    = SCRIPT_DIR / ".tofu-bin"

SKIP_BLOCK_TYPES = {"timeouts"}


# ── Utilities ─────────────────────────────────────────────────────────────────

def log(msg: str) -> None:
    print(msg)


def die(msg: str) -> None:
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def fetch_json(url: str) -> dict:
    req = urllib.request.Request(url, headers={"User-Agent": "test-local/1.0"})
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.loads(r.read())


# ── OpenTofu install ──────────────────────────────────────────────────────────

def ensure_tofu() -> str:
    """Return path to the tofu binary, downloading it locally if not in PATH."""
    existing = shutil.which("tofu")
    if existing:
        log(f"tofu found: {existing}")
        return existing

    log("tofu not in PATH — downloading OpenTofu ...")

    system  = platform.system().lower()
    machine = platform.machine().lower()

    os_name = {"linux": "linux", "darwin": "darwin", "windows": "windows"}.get(system)
    if not os_name:
        die(f"Unsupported OS: {system}")

    arch = {"x86_64": "amd64", "amd64": "amd64", "arm64": "arm64", "aarch64": "arm64"}.get(machine)
    if not arch:
        die(f"Unsupported architecture: {machine}")

    log("  Fetching latest OpenTofu release from GitHub ...")
    release    = fetch_json("https://api.github.com/repos/opentofu/opentofu/releases/latest")
    tag        = release["tag_name"]           # e.g. "v1.9.1"
    version    = tag.lstrip("v")
    asset_name = f"tofu_{version}_{os_name}_{arch}.zip"

    asset_url = next(
        (a["browser_download_url"] for a in release["assets"] if a["name"] == asset_name),
        None,
    )
    if not asset_url:
        die(f"Asset not found in release {tag}: {asset_name}")

    log(f"  Downloading {asset_name} ...")
    BIN_DIR.mkdir(parents=True, exist_ok=True)
    zip_path = BIN_DIR / asset_name
    urllib.request.urlretrieve(asset_url, zip_path)

    log("  Extracting ...")
    with zipfile.ZipFile(zip_path) as zf:
        zf.extractall(BIN_DIR)
    zip_path.unlink()

    binary = BIN_DIR / ("tofu.exe" if os_name == "windows" else "tofu")
    if not binary.exists():
        die(f"Binary not found after extraction: {binary}")

    if os_name != "windows":
        binary.chmod(binary.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

    log(f"  Installed OpenTofu {version} → {binary}")
    return str(binary)


# ── Registry ──────────────────────────────────────────────────────────────────

def get_latest_version() -> str:
    url = f"https://{REGISTRY}/v1/providers/{NAMESPACE}/{PROVIDER}/versions"
    log(f"Resolving latest {PROVIDER} version from {REGISTRY} ...")
    data     = fetch_json(url)
    versions = [v["version"] for v in data.get("versions", [])]
    if not versions:
        die("No versions found in registry response")

    def semver_key(v: str) -> tuple:
        try:
            return tuple(int(x) for x in v.split("."))
        except ValueError:
            return (0, 0, 0)

    versions.sort(key=semver_key, reverse=True)
    latest = versions[0]
    log(f"Latest {PROVIDER}: {latest}")
    return latest


# ── Schema ────────────────────────────────────────────────────────────────────

def fetch_schema(tofu_bin: str, version: str) -> dict:
    source = f"{REGISTRY}/{NAMESPACE}/{PROVIDER}"
    log(f"Initialising provider {source}@{version} in temp dir ...")

    tmp = Path(tempfile.mkdtemp(prefix="tofu-schema-"))
    try:
        (tmp / "versions.tf").write_text(
            f'terraform {{\n'
            f'  required_providers {{\n'
            f'    {PROVIDER} = {{\n'
            f'      source  = "{source}"\n'
            f'      version = "= {version}"\n'
            f'    }}\n'
            f'  }}\n'
            f'}}\n'
        )

        env = {**os.environ, "TF_INPUT": "0", "TF_IN_AUTOMATION": "1"}

        result = subprocess.run(
            [tofu_bin, "init", "-input=false", "-no-color", "-backend=false"],
            cwd=tmp, capture_output=True, text=True, env=env,
        )
        if result.returncode != 0:
            die(f"tofu init failed:\n{result.stdout}\n{result.stderr}")
        log("  init OK")

        result = subprocess.run(
            [tofu_bin, "providers", "schema", "-json"],
            cwd=tmp, capture_output=True, text=True, env=env,
        )
        if result.returncode != 0:
            die(f"tofu providers schema failed:\n{result.stdout}\n{result.stderr}")
        log("  schema extracted")

        return json.loads(result.stdout)
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


# ── Pluralisation ─────────────────────────────────────────────────────────────

def pluralise(word: str) -> str:
    parts = word.split("_")
    last  = parts[-1]
    if last.endswith("y") and len(last) > 1 and last[-2] not in "aeiou":
        last = last[:-1] + "ies"
    elif last.endswith(("sh", "ch", "ss", "x", "z")):
        last += "es"
    elif not last.endswith("s"):
        last += "s"
    parts[-1] = last
    return "_".join(parts)


# ── HCL type conversion ───────────────────────────────────────────────────────

def tf_type_to_hcl(t, depth: int = 0) -> str:
    pad       = "    " * depth
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
    return not (
        attr.get("computed", False)
        and not attr.get("optional", False)
        and not attr.get("required", False)
    )


def collect_attrs(block: dict) -> tuple[dict, dict]:
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
    pad       = "    " * depth
    inner_pad = "    " * (depth + 1)
    mode      = bt.get("nesting_mode", "list")
    required  = bool(bt.get("min_items", 0))
    inner_block = bt["block"]

    lines: list[str] = []
    req_attrs, opt_attrs = collect_attrs(inner_block)

    for name, attr in req_attrs.items():
        lines.append(f"{inner_pad}{name} = {tf_type_to_hcl(attr.get('type', 'any'), depth + 1)}")
    for name, attr in opt_attrs.items():
        lines.append(f"{inner_pad}{name} = optional({tf_type_to_hcl(attr.get('type', 'any'), depth + 1)})")
    for nested_name, nested_bt in sorted(inner_block.get("block_types", {}).items()):
        if nested_name in SKIP_BLOCK_TYPES:
            continue
        nested_hcl, nested_req = block_type_to_hcl(nested_bt, depth + 1)
        if nested_req:
            lines.append(f"{inner_pad}{nested_name} = {nested_hcl}")
        else:
            lines.append(f"{inner_pad}{nested_name} = optional({nested_hcl})")

    inner_str = "\n".join(lines)
    obj_str   = f"object({{\n{inner_str}\n{pad}}})"

    if mode == "single":
        container = obj_str
    elif mode == "map":
        container = f"map({obj_str})"
    else:
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

    type_lines: list[str] = []
    for name, attr in req_attrs.items():
        type_lines.append(f"    {name} = {tf_type_to_hcl(attr.get('type', 'any'), depth=2)}")
    for name, attr in opt_attrs.items():
        type_lines.append(f"    {name} = optional({tf_type_to_hcl(attr.get('type', 'any'), depth=2)})")
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
        f"  description = <<EOT\n{description}\nEOT\n\n"
        f"  type = map(object({{\n{type_body}\n  }}))\n"
        f"}}\n"
    )


def _dynamic_block(bt_name: str, bt: dict, indent: int) -> list[str]:
    pad        = " " * indent
    mode       = bt.get("nesting_mode", "list")
    inner_block = bt["block"]
    req_attrs, opt_attrs = collect_attrs(inner_block)
    inner_all  = {**req_attrs, **opt_attrs}
    inner_bts  = {k: v for k, v in inner_block.get("block_types", {}).items() if k not in SKIP_BLOCK_TYPES}
    inner_max  = max((len(n) for n in inner_all), default=0)

    if mode == "single":
        fe = f"each.value.{bt_name} != null ? [each.value.{bt_name}] : []"
    elif mode == "map":
        fe = f"each.value.{bt_name} != null ? each.value.{bt_name} : {{}}"
    else:
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

    for nested_name, nested_bt in sorted(inner_bts.items()):
        nested_mode = nested_bt.get("nesting_mode", "list")
        nested_req, nested_opt = collect_attrs(nested_bt["block"])
        nested_all  = {**nested_req, **nested_opt}
        nested_max  = max((len(n) for n in nested_all), default=0)

        if nested_mode == "single":
            nfe = f"{bt_name}.value.{nested_name} != null ? [{bt_name}.value.{nested_name}] : []"
        elif nested_mode == "map":
            nfe = f"{bt_name}.value.{nested_name} != null ? {bt_name}.value.{nested_name} : {{}}"
        else:
            nfe = f"{bt_name}.value.{nested_name} != null ? {bt_name}.value.{nested_name} : []"

        lines.extend([
            "", f'{pad}    dynamic "{nested_name}" {{',
            f"{pad}      for_each = {nfe}",
            f"{pad}      content {{",
        ])
        for name in nested_all:
            apad = " " * (nested_max - len(name) + 1)
            lines.append(f"{pad}        {name}{apad}= {nested_name}.value.{name}")
        lines.extend([f"{pad}      }}", f"{pad}    }}"])

    lines.extend([f"{pad}  }}", f"{pad}}}"])
    return lines


def generate_main_tf(resource_type: str, var_name: str, block: dict) -> str:
    req_attrs, opt_attrs = collect_attrs(block)
    all_attrs   = {**req_attrs, **opt_attrs}
    block_types = {k: v for k, v in block.get("block_types", {}).items() if k not in SKIP_BLOCK_TYPES}
    max_len     = max((len(n) for n in all_attrs), default=0)

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


def generate_versions_tf(version: str) -> str:
    return (
        f"terraform {{\n"
        f"  required_providers {{\n"
        f"    {PROVIDER} = {{\n"
        f'      source  = "{NAMESPACE}/{PROVIDER}"\n'
        f'      version = "~> {version}"\n'
        f"    }}\n"
        f"  }}\n"
        f"}}\n"
    )


# ── Main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    log("=" * 60)
    log("OpenTofu module test")
    log(f"Resource types: {', '.join(RESOURCE_TYPES)}")
    log("=" * 60)

    tofu_bin = ensure_tofu()
    version  = get_latest_version()
    schema   = fetch_schema(tofu_bin, version)

    provider_schemas = schema.get("provider_schemas", {})
    schema_key = next((k for k in provider_schemas if PROVIDER in k), None)
    if not schema_key:
        die(f"Provider key not found. Available: {list(provider_schemas)}")

    resource_schemas = provider_schemas[schema_key].get("resource_schemas", {})
    log(f"Schema contains {len(resource_schemas)} resource types total")
    log("")

    out_dir         = OUTPUT_DIR / PROVIDER / version
    provider_prefix = PROVIDER + "_"
    generated       = []

    for resource_type in RESOURCE_TYPES:
        if resource_type not in resource_schemas:
            log(f"  WARNING: {resource_type} not found in schema — skipping")
            continue

        base     = resource_type[len(provider_prefix):] if resource_type.startswith(provider_prefix) else resource_type
        var_name = pluralise(base)
        block    = resource_schemas[resource_type].get("block", {})

        module_dir = out_dir / resource_type
        module_dir.mkdir(parents=True, exist_ok=True)

        (module_dir / "main.tf").write_text(generate_main_tf(resource_type, var_name, block))
        (module_dir / "variables.tf").write_text(generate_variables_tf(resource_type, var_name, block))
        (module_dir / "outputs.tf").write_text(generate_outputs_tf(resource_type, var_name, base))
        (module_dir / "versions.tf").write_text(generate_versions_tf(version))

        log(f"  + {resource_type}  ({var_name})  →  {module_dir}")
        generated.append(resource_type)

    log("")
    log(f"Done. {len(generated)} module(s) written under {out_dir}")


if __name__ == "__main__":
    main()
