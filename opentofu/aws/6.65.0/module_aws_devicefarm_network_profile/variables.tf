variable "devicefarm_network_profiles" {
  description = <<EOT
Map of devicefarm_network_profiles, attributes below
Required:
    - name
    - project_arn
Optional:
    - description
    - downlink_bandwidth_bits
    - downlink_delay_ms
    - downlink_jitter_ms
    - downlink_loss_percent
    - region
    - tags
    - tags_all
    - type
    - uplink_bandwidth_bits
    - uplink_delay_ms
    - uplink_jitter_ms
    - uplink_loss_percent
EOT

  type = map(object({
    name                    = string
    project_arn             = string
    description             = optional(string)
    downlink_bandwidth_bits = optional(number)
    downlink_delay_ms       = optional(number)
    downlink_jitter_ms      = optional(number)
    downlink_loss_percent   = optional(number)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    type                    = optional(string)
    uplink_bandwidth_bits   = optional(number)
    uplink_delay_ms         = optional(number)
    uplink_jitter_ms        = optional(number)
    uplink_loss_percent     = optional(number)
  }))
}
