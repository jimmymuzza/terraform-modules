variable "apprunner_default_auto_scaling_configuration_versions" {
  description = <<EOT
Map of apprunner_default_auto_scaling_configuration_versions, attributes below
Required:
    - auto_scaling_configuration_arn
Optional:
    - region
EOT

  type = map(object({
    auto_scaling_configuration_arn = string
    region                         = optional(string)
  }))
}
