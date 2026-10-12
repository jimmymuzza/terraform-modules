variable "iot_event_configurations" {
  description = <<EOT
Map of iot_event_configurations, attributes below
Required:
    - event_configurations
Optional:
    - region
EOT

  type = map(object({
    event_configurations = map(bool)
    region               = optional(string)
  }))
}
