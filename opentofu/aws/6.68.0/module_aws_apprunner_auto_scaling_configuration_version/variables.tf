variable "apprunner_auto_scaling_configuration_versions" {
  description = <<EOT
Map of apprunner_auto_scaling_configuration_versions, attributes below
Required:
    - auto_scaling_configuration_name
Optional:
    - max_concurrency
    - max_size
    - min_size
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    auto_scaling_configuration_name = string
    max_concurrency                 = optional(number)
    max_size                        = optional(number)
    min_size                        = optional(number)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
}
