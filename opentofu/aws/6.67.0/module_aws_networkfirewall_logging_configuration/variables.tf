variable "networkfirewall_logging_configurations" {
  description = <<EOT
Map of networkfirewall_logging_configurations, attributes below
Required:
    - firewall_arn
    - logging_configuration
Optional:
    - enable_monitoring_dashboard
    - region
EOT

  type = map(object({
    firewall_arn                = string
    enable_monitoring_dashboard = optional(bool)
    region                      = optional(string)
    logging_configuration       = list(object({
            log_destination_config = set(object({
                log_destination      = map(string)
                log_destination_type = string
                log_type             = string
            }))
        }))
  }))
}
