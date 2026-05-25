variable "bot_channels_registrations" {
  description = <<EOT
Map of bot_channels_registrations, attributes below
Required:
    - location
    - microsoft_app_id
    - name
    - resource_group_name
    - sku
Optional:
    - cmk_key_vault_url
    - description
    - developer_app_insights_api_key
    - developer_app_insights_application_id
    - developer_app_insights_key
    - display_name
    - endpoint
    - icon_url
    - microsoft_app_tenant_id
    - microsoft_app_type
    - microsoft_app_user_assigned_identity_id
    - public_network_access_enabled
    - streaming_endpoint_enabled
    - tags
EOT

  type = map(object({
    location                                = string
    microsoft_app_id                        = string
    name                                    = string
    resource_group_name                     = string
    sku                                     = string
    cmk_key_vault_url                       = optional(string)
    description                             = optional(string)
    developer_app_insights_api_key          = optional(string)
    developer_app_insights_application_id   = optional(string)
    developer_app_insights_key              = optional(string)
    display_name                            = optional(string)
    endpoint                                = optional(string)
    icon_url                                = optional(string)
    microsoft_app_tenant_id                 = optional(string)
    microsoft_app_type                      = optional(string)
    microsoft_app_user_assigned_identity_id = optional(string)
    public_network_access_enabled           = optional(bool)
    streaming_endpoint_enabled              = optional(bool)
    tags                                    = optional(map(string))
  }))
}
