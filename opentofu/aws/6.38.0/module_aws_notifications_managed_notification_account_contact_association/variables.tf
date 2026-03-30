variable "notifications_managed_notification_account_contact_associations" {
  description = <<EOT
Map of notifications_managed_notification_account_contact_associations, attributes below
Required:
    - contact_identifier
    - managed_notification_configuration_arn
EOT

  type = map(object({
    contact_identifier                     = string
    managed_notification_configuration_arn = string
  }))
}
