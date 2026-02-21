# Terraform Modules

Auto-generated OpenTofu wrapper modules for Terraform providers. Each module wraps a single resource type using a `for_each` pattern, so you can drive it entirely from a `terragrunt.hcl` or `*.tfvars` file with no modification.

## How it works

`scripts/generate.py` queries the Terraform registry for the latest provider version, extracts the full resource schema, and generates four files per resource type:

| File | Purpose |
|------|---------|
| `main.tf` | Resource block iterating over `var.<resource_type_plural>` |
| `variables.tf` | Single `map(object(...))` variable with required and optional attributes typed correctly |
| `outputs.tf` | Exposes the full resource map as an output |
| `versions.tf` | Pessimistic provider version constraint (`~> major.minor`) |

Modules are written to:

```
opentofu/<provider>/<version>/module_<resource_type>/
```

## Usage

Reference a module directly from the generated path:

```hcl
module "resource_groups" {
  source = "./opentofu/azurerm/4.61.0/module_azurerm_resource_group"

  resource_groups = {
    rg-prod = {
      name     = "rg-prod"
      location = "uksouth"
    }
  }
}
```

## Running the generator

Requires Python 3.8+ and internet access. OpenTofu must be installed and available in PATH (or placed at `.tofu-bin/tofu.exe`).

```bash
# Generate all providers defined in scripts/providers.json
python scripts/generate.py

# Single provider, latest version
python scripts/generate.py azurerm

# Single provider, pinned version
python scripts/generate.py aws --version 6.33.0

# Regenerate modules that already exist
python scripts/generate.py azurerm --force
```

Existing modules are skipped automatically — only missing resource types are generated on subsequent runs.

## Configuration

Edit `scripts/providers.json` to add providers or pin versions:

```json
{
  "default_tool": "tofu",
  "providers": [
    { "provider": "azurerm", "namespace": "hashicorp" },
    { "provider": "aws",     "namespace": "hashicorp", "version": "6.33.0" }
  ]
}
```

## Repository layout

```
current-examples/   Hand-crafted reference modules
opentofu/           Auto-generated modules
scripts/            Generation script and provider config
```
