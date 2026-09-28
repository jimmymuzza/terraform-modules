variable "storage_discovery_workspaces" {
  description = <<EOT
Map of storage_discovery_workspaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - workspace_roots
    - scope
Optional:
    - description
    - sku
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    workspace_roots     = set(string)
    description         = optional(string)
    sku                 = optional(string)
    tags                = optional(map(string))
    scope               = list(object({
            display_name   = string
            resource_types = set(string)
            tag_keys_only  = optional(set(string))
            tags           = optional(map(string))
        }))
  }))
}
