variable "monitor_aad_diagnostic_settings" {
  description = <<EOT
Map of monitor_aad_diagnostic_settings, attributes below
Required:
    - name
Optional:
    - eventhub_authorization_rule_id
    - eventhub_name
    - log_analytics_workspace_id
    - storage_account_id
    - enabled_log
EOT

  type = map(object({
    name                           = string
    eventhub_authorization_rule_id = optional(string)
    eventhub_name                  = optional(string)
    log_analytics_workspace_id     = optional(string)
    storage_account_id             = optional(string)
    enabled_log                    = optional(set(object({
            category = string
        })))
  }))
}
