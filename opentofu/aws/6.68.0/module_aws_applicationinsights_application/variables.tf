variable "applicationinsights_applications" {
  description = <<EOT
Map of applicationinsights_applications, attributes below
Required:
    - resource_group_name
Optional:
    - auto_config_enabled
    - auto_create
    - cwe_monitor_enabled
    - grouping_type
    - ops_center_enabled
    - ops_item_sns_topic_arn
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    resource_group_name    = string
    auto_config_enabled    = optional(bool)
    auto_create            = optional(bool)
    cwe_monitor_enabled    = optional(bool)
    grouping_type          = optional(string)
    ops_center_enabled     = optional(bool)
    ops_item_sns_topic_arn = optional(string)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
