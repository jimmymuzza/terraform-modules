# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository contains Terraform modules exported from providers. Each module wraps a single provider resource type using a `for_each` pattern, allowing users to bring their own `terragrunt.hcl` or `*.tfvars` files.

## Module Structure

Every module lives in its own directory and consists of exactly four files:

- **`main.tf`** — One resource block using `for_each = var.<resource_type_plural>`; all attributes mapped via `each.value.<attr>`
- **`variables.tf`** — A single `map(object(...))` variable named after the resource type (plural); required attributes use bare types, optional attributes use `optional(type)`
- **`outputs.tf`** — A single output exposing the entire resource map
- **`versions.tf`** — Provider version constraint for the module

## Conventions

**Variable naming:** The variable and output names are the pluralised resource type (e.g., `azurerm_resource_group` → `resource_groups`).

**Type mapping for variables.tf:**
- Required, non-computed attributes → bare type (e.g., `string`, `set(string)`)
- Optional or computed attributes → `optional(type)` (e.g., `optional(string)`, `optional(map(string))`)

**Description block in variables.tf** uses a heredoc listing Required and Optional attributes separately:
```hcl
description = <<EOT
Map of resource_groups, attributes below
Required:
    - location
    - name
Optional:
    - managed_by
    - tags
EOT
```

**versions.tf** uses a pessimistic constraint (`~>`) locked to the patch version of the provider used at generation time.

## Directory Layout

```
current-examples/        # Hand-crafted reference modules
  azurerm_resource_group/
  azurerm_management_group/

new-exports/             # Auto-generated modules go here
  terraform/
    <provider>/          # e.g. azurerm
      <version>/         # e.g. 4.61.0
        <resource_type>/ # e.g. azurerm_resource_group
```

## Automation (Planned)

A PowerShell script (`new-exports/`) will auto-generate modules by:
1. Querying the Terraform Registry API for provider versions
2. Using `terraform providers schema -json` to extract resource schemas
3. Generating the four module files for every resource type
4. Organising output under `new-exports/terraform/<provider>/<version>/<resource_type>/`
