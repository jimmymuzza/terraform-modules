variable "notifications_channel_associations" {
  description = <<EOT
Map of notifications_channel_associations, attributes below
Required:
    - arn
    - notification_configuration_arn
EOT

  type = map(object({
    arn                            = string
    notification_configuration_arn = string
  }))
}
