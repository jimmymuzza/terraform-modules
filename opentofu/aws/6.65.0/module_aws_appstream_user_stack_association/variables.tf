variable "appstream_user_stack_associations" {
  description = <<EOT
Map of appstream_user_stack_associations, attributes below
Required:
    - authentication_type
    - stack_name
    - user_name
Optional:
    - region
    - send_email_notification
EOT

  type = map(object({
    authentication_type     = string
    stack_name              = string
    user_name               = string
    region                  = optional(string)
    send_email_notification = optional(bool)
  }))
}
