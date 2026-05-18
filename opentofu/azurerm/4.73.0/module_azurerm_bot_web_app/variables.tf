variable "bot_web_apps" {
  description = <<EOT
Map of bot_web_apps, attributes below
Required:
    - location
    - microsoft_app_id
    - name
    - resource_group_name
    - sku
Optional:
    - developer_app_insights_api_key
    - developer_app_insights_application_id
    - developer_app_insights_key
    - display_name
    - endpoint
    - luis_app_ids
    - luis_key
    - microsoft_app_tenant_id
    - microsoft_app_type
    - microsoft_app_user_assigned_identity_id
    - tags
EOT

  type = map(object({
    location                                = string
    microsoft_app_id                        = string
    name                                    = string
    resource_group_name                     = string
    sku                                     = string
    developer_app_insights_api_key          = optional(string)
    developer_app_insights_application_id   = optional(string)
    developer_app_insights_key              = optional(string)
    display_name                            = optional(string)
    endpoint                                = optional(string)
    luis_app_ids                            = optional(list(string))
    luis_key                                = optional(string)
    microsoft_app_tenant_id                 = optional(string)
    microsoft_app_type                      = optional(string)
    microsoft_app_user_assigned_identity_id = optional(string)
    tags                                    = optional(map(string))
  }))
}
