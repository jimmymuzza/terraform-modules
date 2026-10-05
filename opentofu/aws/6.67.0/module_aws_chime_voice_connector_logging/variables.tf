variable "chime_voice_connector_loggings" {
  description = <<EOT
Map of chime_voice_connector_loggings, attributes below
Required:
    - voice_connector_id
Optional:
    - enable_media_metric_logs
    - enable_sip_logs
    - region
EOT

  type = map(object({
    voice_connector_id       = string
    enable_media_metric_logs = optional(bool)
    enable_sip_logs          = optional(bool)
    region                   = optional(string)
  }))
}
