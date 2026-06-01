variable "securityhub_organization_configurations" {
  description = <<EOT
Map of securityhub_organization_configurations, attributes below
Required:
    - auto_enable
Optional:
    - auto_enable_standards
    - region
    - organization_configuration
EOT

  type = map(object({
    auto_enable                = bool
    auto_enable_standards      = optional(string)
    region                     = optional(string)
    organization_configuration = optional(list(object({
            configuration_type = string
        })))
  }))
}
