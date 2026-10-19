variable "sentinel_alert_rule_ms_security_incidents" {
  description = <<EOT
Map of sentinel_alert_rule_ms_security_incidents, attributes below
Required:
    - display_name
    - log_analytics_workspace_id
    - name
    - product_filter
    - severity_filter
Optional:
    - alert_rule_template_guid
    - description
    - display_name_exclude_filter
    - display_name_filter
    - enabled
EOT

  type = map(object({
    display_name                = string
    log_analytics_workspace_id  = string
    name                        = string
    product_filter              = string
    severity_filter             = set(string)
    alert_rule_template_guid    = optional(string)
    description                 = optional(string)
    display_name_exclude_filter = optional(set(string))
    display_name_filter         = optional(set(string))
    enabled                     = optional(bool)
  }))
}
