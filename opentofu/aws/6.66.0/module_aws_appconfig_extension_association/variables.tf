variable "appconfig_extension_associations" {
  description = <<EOT
Map of appconfig_extension_associations, attributes below
Required:
    - extension_arn
    - resource_arn
Optional:
    - parameters
    - region
EOT

  type = map(object({
    extension_arn = string
    resource_arn  = string
    parameters    = optional(map(string))
    region        = optional(string)
  }))
}
