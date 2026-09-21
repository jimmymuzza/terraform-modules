variable "mssql_server_extended_auditing_policies" {
  description = <<EOT
Map of mssql_server_extended_auditing_policies, attributes below
Required:
    - server_id
Optional:
    - audit_actions_and_groups
    - blob_storage_endpoint
    - enabled
    - log_monitoring_enabled
    - predicate_expression
    - retention_in_days
    - storage_account_access_key
    - storage_account_access_key_is_secondary
    - storage_account_subscription_id
EOT

  type = map(object({
    server_id                               = string
    audit_actions_and_groups                = optional(list(string))
    blob_storage_endpoint                   = optional(string)
    enabled                                 = optional(bool)
    log_monitoring_enabled                  = optional(bool)
    predicate_expression                    = optional(string)
    retention_in_days                       = optional(number)
    storage_account_access_key              = optional(string)
    storage_account_access_key_is_secondary = optional(bool)
    storage_account_subscription_id         = optional(string)
  }))
}
