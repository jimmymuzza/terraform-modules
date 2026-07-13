variable "config_retention_configurations" {
  description = <<EOT
Map of config_retention_configurations, attributes below
Required:
    - retention_period_in_days
Optional:
    - region
EOT

  type = map(object({
    retention_period_in_days = number
    region                   = optional(string)
  }))
}
