variable "licensemanager_associations" {
  description = <<EOT
Map of licensemanager_associations, attributes below
Required:
    - license_configuration_arn
    - resource_arn
Optional:
    - region
EOT

  type = map(object({
    license_configuration_arn = string
    resource_arn              = string
    region                    = optional(string)
  }))
}
