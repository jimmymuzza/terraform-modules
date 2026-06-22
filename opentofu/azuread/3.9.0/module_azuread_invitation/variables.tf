variable "invitations" {
  description = <<EOT
Map of invitations, attributes below
Required:
    - redirect_url
    - user_email_address
Optional:
    - user_display_name
    - user_type
    - message
EOT

  type = map(object({
    redirect_url       = string
    user_email_address = string
    user_display_name  = optional(string)
    user_type          = optional(string)
    message            = optional(list(object({
            additional_recipients = optional(list(string))
            body                  = optional(string)
            language              = optional(string)
        })))
  }))
}
