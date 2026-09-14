variable "sentinel_alert_rule_machine_learning_behavior_analytics" {
  description = <<EOT
Map of sentinel_alert_rule_machine_learning_behavior_analytics, attributes below
Required:
    - alert_rule_template_guid
    - log_analytics_workspace_id
    - name
Optional:
    - enabled
EOT

  type = map(object({
    alert_rule_template_guid   = string
    log_analytics_workspace_id = string
    name                       = string
    enabled                    = optional(bool)
  }))
}
