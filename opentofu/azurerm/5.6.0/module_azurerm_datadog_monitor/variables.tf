variable "datadog_monitors" {
  description = <<EOT
Map of datadog_monitors, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - datadog_organization
    - user
Optional:
    - monitoring_enabled
    - tags
    - identity
EOT

  type = map(object({
    location             = string
    name                 = string
    resource_group_name  = string
    sku_name             = string
    monitoring_enabled   = optional(bool)
    tags                 = optional(map(string))
    datadog_organization = list(object({
            api_key           = string
            application_key   = string
            enterprise_app_id = optional(string)
            linking_auth_code = optional(string)
            linking_client_id = optional(string)
            redirect_uri      = optional(string)
        }))
    identity             = optional(list(object({
            type = string
        })))
    user                 = list(object({
            email        = string
            name         = string
            phone_number = optional(string)
        }))
  }))
}
