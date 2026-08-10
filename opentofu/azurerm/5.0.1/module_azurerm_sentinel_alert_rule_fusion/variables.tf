variable "sentinel_alert_rule_fusions" {
  description = <<EOT
Map of sentinel_alert_rule_fusions, attributes below
Required:
    - alert_rule_template_guid
    - log_analytics_workspace_id
Optional:
    - enabled
    - source
EOT

  type = map(object({
    alert_rule_template_guid   = string
    log_analytics_workspace_id = string
    enabled                    = optional(bool)
    source                     = optional(list(object({
            name     = string
            enabled  = optional(bool)
            sub_type = optional(list(object({
                name               = string
                severities_allowed = set(string)
                enabled            = optional(bool)
            })))
        })))
  }))
}
