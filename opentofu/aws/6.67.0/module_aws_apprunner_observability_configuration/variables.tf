variable "apprunner_observability_configurations" {
  description = <<EOT
Map of apprunner_observability_configurations, attributes below
Required:
    - observability_configuration_name
Optional:
    - region
    - tags
    - tags_all
    - trace_configuration
EOT

  type = map(object({
    observability_configuration_name = string
    region                           = optional(string)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    trace_configuration              = optional(list(object({
            vendor = optional(string)
        })))
  }))
}
