variable "security_center_subscription_pricings" {
  description = <<EOT
Map of security_center_subscription_pricings, attributes below
Required:
    - tier
Optional:
    - resource_type
    - subplan
    - extension
EOT

  type = map(object({
    tier          = string
    resource_type = optional(string)
    subplan       = optional(string)
    extension     = optional(set(object({
            name                            = string
            additional_extension_properties = optional(map(string))
        })))
  }))
}
