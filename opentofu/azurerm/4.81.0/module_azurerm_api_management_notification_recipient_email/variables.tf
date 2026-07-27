variable "api_management_notification_recipient_emails" {
  description = <<EOT
Map of api_management_notification_recipient_emails, attributes below
Required:
    - api_management_id
    - email
    - notification_type
EOT

  type = map(object({
    api_management_id = string
    email             = string
    notification_type = string
  }))
}
