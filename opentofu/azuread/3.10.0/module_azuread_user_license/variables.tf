variable "user_licenses" {
  description = <<EOT
Map of user_licenses, attributes below
Required:
    - sku_id
    - user_object_id
Optional:
    - disabled_plans
EOT

  type = map(object({
    sku_id         = string
    user_object_id = string
    disabled_plans = optional(set(string))
  }))
}
