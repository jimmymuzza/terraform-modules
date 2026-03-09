variable "lakeformation_identity_center_configurations" {
  description = <<EOT
Map of lakeformation_identity_center_configurations, attributes below
Required:
    - instance_arn
Optional:
    - catalog_id
    - region
EOT

  type = map(object({
    instance_arn = string
    catalog_id   = optional(string)
    region       = optional(string)
  }))
}
