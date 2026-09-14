variable "monitor_diagnostic_settings" {
  description = <<EOT
Map of monitor_diagnostic_settings, attributes below
Required:
    - name
    - target_resource_id
Optional:
    - eventhub_authorization_rule_id
    - eventhub_name
    - log_analytics_destination_type
    - log_analytics_workspace_id
    - partner_solution_id
    - storage_account_id
    - enabled_log
    - enabled_metric
EOT

  type = map(object({
    name                           = string
    target_resource_id             = string
    eventhub_authorization_rule_id = optional(string)
    eventhub_name                  = optional(string)
    log_analytics_destination_type = optional(string)
    log_analytics_workspace_id     = optional(string)
    partner_solution_id            = optional(string)
    storage_account_id             = optional(string)
    enabled_log                    = optional(set(object({
            category       = optional(string)
            category_group = optional(string)
        })))
    enabled_metric                 = optional(set(object({
            category = string
        })))
  }))
}
