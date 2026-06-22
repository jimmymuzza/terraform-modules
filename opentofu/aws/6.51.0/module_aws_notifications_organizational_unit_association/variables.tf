variable "notifications_organizational_unit_associations" {
  description = <<EOT
Map of notifications_organizational_unit_associations, attributes below
Required:
    - notification_configuration_arn
    - organizational_unit_id
EOT

  type = map(object({
    notification_configuration_arn = string
    organizational_unit_id         = string
  }))
}
