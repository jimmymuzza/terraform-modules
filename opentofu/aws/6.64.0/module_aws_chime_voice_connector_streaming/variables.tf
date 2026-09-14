variable "chime_voice_connector_streamings" {
  description = <<EOT
Map of chime_voice_connector_streamings, attributes below
Required:
    - data_retention
    - voice_connector_id
Optional:
    - disabled
    - region
    - streaming_notification_targets
    - media_insights_configuration
EOT

  type = map(object({
    data_retention                 = number
    voice_connector_id             = string
    disabled                       = optional(bool)
    region                         = optional(string)
    streaming_notification_targets = optional(set(string))
    media_insights_configuration   = optional(list(object({
            configuration_arn = optional(string)
            disabled          = optional(bool)
        })))
  }))
}
