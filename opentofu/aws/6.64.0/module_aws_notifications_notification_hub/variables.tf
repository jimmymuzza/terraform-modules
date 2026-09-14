variable "notifications_notification_hubs" {
  description = <<EOT
Map of notifications_notification_hubs, attributes below
Required:
    - notification_hub_region
EOT

  type = map(object({
    notification_hub_region = string
  }))
}
