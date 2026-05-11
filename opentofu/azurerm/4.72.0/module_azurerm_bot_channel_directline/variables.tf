variable "bot_channel_directlines" {
  description = <<EOT
Map of bot_channel_directlines, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
    - site
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    site                = set(object({
            name                            = string
            enabled                         = optional(bool)
            endpoint_parameters_enabled     = optional(bool)
            enhanced_authentication_enabled = optional(bool)
            storage_enabled                 = optional(bool)
            trusted_origins                 = optional(set(string))
            user_upload_enabled             = optional(bool)
            v1_allowed                      = optional(bool)
            v3_allowed                      = optional(bool)
        }))
  }))
}
