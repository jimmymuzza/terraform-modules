variable "bot_channel_alexas" {
  description = <<EOT
Map of bot_channel_alexas, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
    - skill_id
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    skill_id            = string
  }))
}
