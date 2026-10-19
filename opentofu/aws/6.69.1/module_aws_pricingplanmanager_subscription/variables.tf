variable "pricingplanmanager_subscriptions" {
  description = <<EOT
Map of pricingplanmanager_subscriptions, attributes below
Required:
    - plan_family
    - plan_tier
    - resource_arns
Optional:
    - approval_mode
    - usage_level
EOT

  type = map(object({
    plan_family   = string
    plan_tier     = string
    resource_arns = set(string)
    approval_mode = optional(string)
    usage_level   = optional(string)
  }))
}
