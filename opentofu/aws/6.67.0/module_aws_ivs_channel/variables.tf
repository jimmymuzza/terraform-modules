variable "ivs_channels" {
  description = <<EOT
Map of ivs_channels, attributes below
Optional:
    - authorized
    - latency_mode
    - name
    - recording_configuration_arn
    - region
    - tags
    - tags_all
    - type
EOT

  type = map(object({
    authorized                  = optional(bool)
    latency_mode                = optional(string)
    name                        = optional(string)
    recording_configuration_arn = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    type                        = optional(string)
  }))
}
