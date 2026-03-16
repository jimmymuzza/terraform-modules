variable "networkmonitor_monitors" {
  description = <<EOT
Map of networkmonitor_monitors, attributes below
Required:
    - monitor_name
Optional:
    - aggregation_period
    - region
    - tags
EOT

  type = map(object({
    monitor_name       = string
    aggregation_period = optional(number)
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
