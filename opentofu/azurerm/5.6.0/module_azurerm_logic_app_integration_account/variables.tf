variable "logic_app_integration_accounts" {
  description = <<EOT
Map of logic_app_integration_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - integration_service_environment_id
    - tags
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    sku_name                           = string
    integration_service_environment_id = optional(string)
    tags                               = optional(map(string))
  }))
}
