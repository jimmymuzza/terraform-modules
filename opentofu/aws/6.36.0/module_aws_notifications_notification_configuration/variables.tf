variable "notifications_notification_configurations" {
  description = <<EOT
Map of notifications_notification_configurations, attributes below
Required:
    - description
    - name
Optional:
    - aggregation_duration
    - tags
EOT

  type = map(object({
    description          = string
    name                 = string
    aggregation_duration = optional(string)
    tags                 = optional(map(string))
  }))
}
