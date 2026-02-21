# Terraform Modules

Auto-generated OpenTofu wrapper modules for Terraform providers. Each module wraps a single resource type using a `for_each` pattern, so you can drive it entirely from a `terragrunt.hcl` or `*.tfvars` file with no modification.

## How it works

A Python script queries the OpenTofu registry for the latest provider version, extracts the full resource schema, and generates four files per resource type:

| File | Purpose |
|------|---------|
| `main.tf` | Resource block iterating over `var.<resource_type_plural>` |
| `variables.tf` | Single `map(object(...))` variable with required and optional attributes typed correctly |
| `outputs.tf` | Exposes the full resource map as an output |
| `versions.tf` | Pessimistic provider version constraint (`~>`) |

Modules are written to:

```
new-exports/terraform/<provider>/<version>/<resource_type>/
```

## Usage

Reference a module directly from the generated path:

```hcl
module "resource_groups" {
  source = "./new-exports/terraform/azurerm/4.61.0/azurerm_resource_group"

  resource_groups = {
    rg-prod = {
      name     = "rg-prod"
      location = "uksouth"
    }
  }
}
```

## Automation

The GitHub Actions workflow runs every Monday at 02:00 UTC and whenever `new-exports/providers.json` is updated. It installs OpenTofu, generates any missing modules, and commits the results back to the repository.

To add a provider or pin a version, edit `new-exports/providers.json`:

```json
{
  "default_tool": "tofu",
  "providers": [
    { "provider": "azurerm", "namespace": "hashicorp" },
    { "provider": "aws",     "namespace": "hashicorp", "version": "6.33.0" }
  ]
}
```

## Local testing

Requires Python 3.8+ and internet access. OpenTofu is downloaded automatically if not already installed.

```bash
python3 test_local.py
```

This generates modules for `azurerm_resource_group`, `azurerm_management_group`, and `azurerm_subscription` into a local `test-output/` directory.

## Repository layout

```
current-examples/   Hand-crafted reference modules
new-exports/        Auto-generated modules and generation script
test_local.py       Standalone local test script
```
