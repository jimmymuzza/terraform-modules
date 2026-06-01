variable "bot_channel_lines" {
  description = <<EOT
Map of bot_channel_lines, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
    - line_channel
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    line_channel        = set(object({
            access_token = string
            secret       = string
        }))
  }))
}
