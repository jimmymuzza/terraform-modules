variable "autoscaling_notifications" {
  description = <<EOT
Map of autoscaling_notifications, attributes below
Required:
    - group_names
    - notifications
    - topic_arn
Optional:
    - region
EOT

  type = map(object({
    group_names   = set(string)
    notifications = set(string)
    topic_arn     = string
    region        = optional(string)
  }))
}
