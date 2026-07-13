variable "api_management_products" {
  description = <<EOT
Map of api_management_products, attributes below
Required:
    - api_management_name
    - display_name
    - product_id
    - published
    - resource_group_name
Optional:
    - approval_required
    - description
    - subscription_required
    - subscriptions_limit
    - terms
EOT

  type = map(object({
    api_management_name   = string
    display_name          = string
    product_id            = string
    published             = bool
    resource_group_name   = string
    approval_required     = optional(bool)
    description           = optional(string)
    subscription_required = optional(bool)
    subscriptions_limit   = optional(number)
    terms                 = optional(string)
  }))
}
