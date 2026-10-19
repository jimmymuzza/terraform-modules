variable "api_management_subscriptions" {
  description = <<EOT
Map of api_management_subscriptions, attributes below
Required:
    - api_management_name
    - display_name
    - resource_group_name
Optional:
    - allow_tracing
    - api_id
    - primary_key
    - product_id
    - secondary_key
    - state
    - subscription_id
    - user_id
EOT

  type = map(object({
    api_management_name = string
    display_name        = string
    resource_group_name = string
    allow_tracing       = optional(bool)
    api_id              = optional(string)
    primary_key         = optional(string)
    product_id          = optional(string)
    secondary_key       = optional(string)
    state               = optional(string)
    subscription_id     = optional(string)
    user_id             = optional(string)
  }))
}
