variable "bot_channel_emails" {
  description = <<EOT
Map of bot_channel_emails, attributes below
Required:
    - bot_name
    - email_address
    - location
    - resource_group_name
Optional:
    - email_password
    - magic_code
EOT

  type = map(object({
    bot_name            = string
    email_address       = string
    location            = string
    resource_group_name = string
    email_password      = optional(string)
    magic_code          = optional(string)
  }))
}
