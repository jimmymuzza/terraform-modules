variable "notifications_event_rules" {
  description = <<EOT
Map of notifications_event_rules, attributes below
Required:
    - event_type
    - notification_configuration_arn
    - regions
    - source
Optional:
    - event_pattern
EOT

  type = map(object({
    event_type                     = string
    notification_configuration_arn = string
    regions                        = set(string)
    source                         = string
    event_pattern                  = optional(string)
  }))
}
