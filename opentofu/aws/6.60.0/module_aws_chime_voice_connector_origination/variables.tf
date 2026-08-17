variable "chime_voice_connector_originations" {
  description = <<EOT
Map of chime_voice_connector_originations, attributes below
Required:
    - voice_connector_id
    - route
Optional:
    - disabled
    - region
EOT

  type = map(object({
    voice_connector_id = string
    disabled           = optional(bool)
    region             = optional(string)
    route              = set(object({
            host     = string
            priority = number
            protocol = string
            weight   = number
            port     = optional(number)
        }))
  }))
}
