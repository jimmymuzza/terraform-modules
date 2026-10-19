variable "bot_channel_web_chats" {
  description = <<EOT
Map of bot_channel_web_chats, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
Optional:
    - site
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    site                = optional(set(object({
            name                        = string
            endpoint_parameters_enabled = optional(bool)
            storage_enabled             = optional(bool)
            user_upload_enabled         = optional(bool)
        })))
  }))
}
