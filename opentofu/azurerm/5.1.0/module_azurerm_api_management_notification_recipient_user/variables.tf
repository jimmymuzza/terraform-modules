variable "api_management_notification_recipient_users" {
  description = <<EOT
Map of api_management_notification_recipient_users, attributes below
Required:
    - api_management_id
    - notification_type
    - user_id
EOT

  type = map(object({
    api_management_id = string
    notification_type = string
    user_id           = string
  }))
}
