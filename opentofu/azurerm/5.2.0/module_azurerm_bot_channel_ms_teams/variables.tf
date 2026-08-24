variable "bot_channel_ms_teams" {
  description = <<EOT
Map of bot_channel_ms_teams, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
Optional:
    - calling_enabled
    - calling_web_hook
    - deployment_environment
EOT

  type = map(object({
    bot_name               = string
    location               = string
    resource_group_name    = string
    calling_enabled        = optional(bool)
    calling_web_hook       = optional(string)
    deployment_environment = optional(string)
  }))
}
