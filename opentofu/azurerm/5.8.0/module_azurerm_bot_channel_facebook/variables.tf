variable "bot_channel_facebooks" {
  description = <<EOT
Map of bot_channel_facebooks, attributes below
Required:
    - bot_name
    - facebook_application_id
    - facebook_application_secret
    - location
    - resource_group_name
    - page
EOT

  type = map(object({
    bot_name                    = string
    facebook_application_id     = string
    facebook_application_secret = string
    location                    = string
    resource_group_name         = string
    page                        = set(object({
            access_token = string
        }))
  }))
}
