variable "xray_groups" {
  description = <<EOT
Map of xray_groups, attributes below
Required:
    - filter_expression
    - group_name
Optional:
    - region
    - tags
    - tags_all
    - insights_configuration
EOT

  type = map(object({
    filter_expression      = string
    group_name             = string
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    insights_configuration = optional(list(object({
            insights_enabled      = bool
            notifications_enabled = optional(bool)
        })))
  }))
}
