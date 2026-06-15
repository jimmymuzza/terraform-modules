variable "ce_anomaly_monitors" {
  description = <<EOT
Map of ce_anomaly_monitors, attributes below
Required:
    - monitor_type
    - name
Optional:
    - monitor_dimension
    - monitor_specification
    - tags
    - tags_all
EOT

  type = map(object({
    monitor_type          = string
    name                  = string
    monitor_dimension     = optional(string)
    monitor_specification = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
  }))
}
