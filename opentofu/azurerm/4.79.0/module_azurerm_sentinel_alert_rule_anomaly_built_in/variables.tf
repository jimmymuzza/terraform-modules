variable "sentinel_alert_rule_anomaly_built_ins" {
  description = <<EOT
Map of sentinel_alert_rule_anomaly_built_ins, attributes below
Required:
    - enabled
    - log_analytics_workspace_id
    - mode
Optional:
    - display_name
    - name
EOT

  type = map(object({
    enabled                    = bool
    log_analytics_workspace_id = string
    mode                       = string
    display_name               = optional(string)
    name                       = optional(string)
  }))
}
