variable "bot_channel_sms" {
  description = <<EOT
Map of bot_channel_sms, attributes below
Required:
    - bot_name
    - location
    - phone_number
    - resource_group_name
    - sms_channel_account_security_id
    - sms_channel_auth_token
EOT

  type = map(object({
    bot_name                        = string
    location                        = string
    phone_number                    = string
    resource_group_name             = string
    sms_channel_account_security_id = string
    sms_channel_auth_token          = string
  }))
}
