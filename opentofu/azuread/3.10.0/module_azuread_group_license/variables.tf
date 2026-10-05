variable "group_licenses" {
  description = <<EOT
Map of group_licenses, attributes below
Required:
    - group_object_id
    - sku_id
Optional:
    - disabled_plans
EOT

  type = map(object({
    group_object_id = string
    sku_id          = string
    disabled_plans  = optional(set(string))
  }))
}
