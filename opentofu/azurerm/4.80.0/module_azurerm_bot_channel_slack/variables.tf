variable "bot_channel_slacks" {
  description = <<EOT
Map of bot_channel_slacks, attributes below
Required:
    - bot_name
    - client_id
    - client_secret
    - location
    - resource_group_name
    - verification_token
Optional:
    - landing_page_url
    - signing_secret
EOT

  type = map(object({
    bot_name            = string
    client_id           = string
    client_secret       = string
    location            = string
    resource_group_name = string
    verification_token  = string
    landing_page_url    = optional(string)
    signing_secret      = optional(string)
  }))
}
