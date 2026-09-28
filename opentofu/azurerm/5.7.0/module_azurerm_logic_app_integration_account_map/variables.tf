variable "logic_app_integration_account_maps" {
  description = <<EOT
Map of logic_app_integration_account_maps, attributes below
Required:
    - content
    - integration_account_name
    - map_type
    - name
    - resource_group_name
Optional:
    - metadata
EOT

  type = map(object({
    content                  = string
    integration_account_name = string
    map_type                 = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(map(string))
  }))
}
