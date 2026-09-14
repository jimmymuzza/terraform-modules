variable "appstream_users" {
  description = <<EOT
Map of appstream_users, attributes below
Required:
    - authentication_type
    - user_name
Optional:
    - enabled
    - first_name
    - last_name
    - region
    - send_email_notification
EOT

  type = map(object({
    authentication_type     = string
    user_name               = string
    enabled                 = optional(bool)
    first_name              = optional(string)
    last_name               = optional(string)
    region                  = optional(string)
    send_email_notification = optional(bool)
  }))
}
