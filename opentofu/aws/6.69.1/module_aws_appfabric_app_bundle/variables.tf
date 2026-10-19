variable "appfabric_app_bundles" {
  description = <<EOT
Map of appfabric_app_bundles, attributes below
Optional:
    - customer_managed_key_arn
    - region
    - tags
EOT

  type = map(object({
    customer_managed_key_arn = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
  }))
}
