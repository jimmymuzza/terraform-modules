variable "macie2_members" {
  description = <<EOT
Map of macie2_members, attributes below
Required:
    - account_id
    - email
Optional:
    - invitation_disable_email_notification
    - invitation_message
    - invite
    - region
    - status
    - tags
    - tags_all
EOT

  type = map(object({
    account_id                            = string
    email                                 = string
    invitation_disable_email_notification = optional(bool)
    invitation_message                    = optional(string)
    invite                                = optional(bool)
    region                                = optional(string)
    status                                = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
  }))
}
