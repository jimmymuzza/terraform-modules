variable "arczonalshift_zonal_autoshift_configurations" {
  description = <<EOT
Map of arczonalshift_zonal_autoshift_configurations, attributes below
Required:
    - resource_arn
    - zonal_autoshift_status
Optional:
    - allowed_windows
    - blocked_dates
    - blocked_windows
    - region
    - blocking_alarms
    - outcome_alarms
EOT

  type = map(object({
    resource_arn           = string
    zonal_autoshift_status = string
    allowed_windows        = optional(list(string))
    blocked_dates          = optional(list(string))
    blocked_windows        = optional(list(string))
    region                 = optional(string)
    blocking_alarms        = optional(list(object({
            alarm_identifier = string
            type             = string
        })))
    outcome_alarms         = optional(list(object({
            alarm_identifier = string
            type             = string
        })))
  }))
}
