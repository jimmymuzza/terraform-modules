variable "notifications_managed_notification_additional_channel_associations" {
  description = <<EOT
Map of notifications_managed_notification_additional_channel_associations, attributes below
Required:
    - channel_arn
    - managed_notification_arn
EOT

  type = map(object({
    channel_arn              = string
    managed_notification_arn = string
  }))
}
