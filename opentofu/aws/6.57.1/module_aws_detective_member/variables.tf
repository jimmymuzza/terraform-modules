variable "detective_members" {
  description = <<EOT
Map of detective_members, attributes below
Required:
    - account_id
    - email_address
    - graph_arn
Optional:
    - disable_email_notification
    - message
    - region
EOT

  type = map(object({
    account_id                 = string
    email_address              = string
    graph_arn                  = string
    disable_email_notification = optional(bool)
    message                    = optional(string)
    region                     = optional(string)
  }))
}
