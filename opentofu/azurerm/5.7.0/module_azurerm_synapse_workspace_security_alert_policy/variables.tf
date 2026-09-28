variable "synapse_workspace_security_alert_policies" {
  description = <<EOT
Map of synapse_workspace_security_alert_policies, attributes below
Required:
    - policy_state
    - synapse_workspace_id
Optional:
    - disabled_alerts
    - email_account_admins_enabled
    - email_addresses
    - retention_days
    - storage_account_access_key
    - storage_endpoint
EOT

  type = map(object({
    policy_state                 = string
    synapse_workspace_id         = string
    disabled_alerts              = optional(set(string))
    email_account_admins_enabled = optional(bool)
    email_addresses              = optional(set(string))
    retention_days               = optional(number)
    storage_account_access_key   = optional(string)
    storage_endpoint             = optional(string)
  }))
}
