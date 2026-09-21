variable "guardduty_members" {
  description = <<EOT
Map of guardduty_members, attributes below
Required:
    - account_id
    - detector_id
    - email
Optional:
    - disable_email_notification
    - invitation_message
    - invite
    - region
EOT

  type = map(object({
    account_id                 = string
    detector_id                = string
    email                      = string
    disable_email_notification = optional(bool)
    invitation_message         = optional(string)
    invite                     = optional(bool)
    region                     = optional(string)
  }))
}
