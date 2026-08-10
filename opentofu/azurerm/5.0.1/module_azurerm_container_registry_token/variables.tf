variable "container_registry_tokens" {
  description = <<EOT
Map of container_registry_tokens, attributes below
Required:
    - container_registry_name
    - name
    - resource_group_name
    - scope_map_id
Optional:
    - enabled
EOT

  type = map(object({
    container_registry_name = string
    name                    = string
    resource_group_name     = string
    scope_map_id            = string
    enabled                 = optional(bool)
  }))
}
