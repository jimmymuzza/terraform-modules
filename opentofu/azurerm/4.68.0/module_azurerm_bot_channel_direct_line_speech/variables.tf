variable "bot_channel_direct_line_speeches" {
  description = <<EOT
Map of bot_channel_direct_line_speeches, attributes below
Required:
    - bot_name
    - cognitive_service_access_key
    - cognitive_service_location
    - location
    - resource_group_name
Optional:
    - cognitive_account_id
    - custom_speech_model_id
    - custom_voice_deployment_id
EOT

  type = map(object({
    bot_name                     = string
    cognitive_service_access_key = string
    cognitive_service_location   = string
    location                     = string
    resource_group_name          = string
    cognitive_account_id         = optional(string)
    custom_speech_model_id       = optional(string)
    custom_voice_deployment_id   = optional(string)
  }))
}
