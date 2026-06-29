variable "mssql_managed_instance_security_alert_policies" {
  description = <<EOT
Map of mssql_managed_instance_security_alert_policies, attributes below
Required:
    - managed_instance_name
    - resource_group_name
Optional:
    - disabled_alerts
    - email_account_admins_enabled
    - email_addresses
    - enabled
    - retention_days
    - storage_account_access_key
    - storage_endpoint
EOT

  type = map(object({
    managed_instance_name        = string
    resource_group_name          = string
    disabled_alerts              = optional(set(string))
    email_account_admins_enabled = optional(bool)
    email_addresses              = optional(set(string))
    enabled                      = optional(bool)
    retention_days               = optional(number)
    storage_account_access_key   = optional(string)
    storage_endpoint             = optional(string)
  }))
}
