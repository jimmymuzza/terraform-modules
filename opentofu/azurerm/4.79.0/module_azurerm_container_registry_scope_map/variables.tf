variable "container_registry_scope_maps" {
  description = <<EOT
Map of container_registry_scope_maps, attributes below
Required:
    - actions
    - container_registry_name
    - name
    - resource_group_name
Optional:
    - description
EOT

  type = map(object({
    actions                 = list(string)
    container_registry_name = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
  }))
}
