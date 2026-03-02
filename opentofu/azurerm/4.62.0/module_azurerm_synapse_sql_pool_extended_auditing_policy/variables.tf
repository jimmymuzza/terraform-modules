variable "synapse_sql_pool_extended_auditing_policies" {
  description = <<EOT
Map of synapse_sql_pool_extended_auditing_policies, attributes below
Required:
    - sql_pool_id
Optional:
    - log_monitoring_enabled
    - retention_in_days
    - storage_account_access_key
    - storage_account_access_key_is_secondary
    - storage_endpoint
EOT

  type = map(object({
    sql_pool_id                             = string
    log_monitoring_enabled                  = optional(bool)
    retention_in_days                       = optional(number)
    storage_account_access_key              = optional(string)
    storage_account_access_key_is_secondary = optional(bool)
    storage_endpoint                        = optional(string)
  }))
}
