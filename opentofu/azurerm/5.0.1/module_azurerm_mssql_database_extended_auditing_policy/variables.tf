variable "mssql_database_extended_auditing_policies" {
  description = <<EOT
Map of mssql_database_extended_auditing_policies, attributes below
Required:
    - database_id
Optional:
    - blob_storage_endpoint
    - enabled
    - log_monitoring_enabled
    - retention_in_days
    - storage_account_access_key
    - storage_account_access_key_is_secondary
EOT

  type = map(object({
    database_id                             = string
    blob_storage_endpoint                   = optional(string)
    enabled                                 = optional(bool)
    log_monitoring_enabled                  = optional(bool)
    retention_in_days                       = optional(number)
    storage_account_access_key              = optional(string)
    storage_account_access_key_is_secondary = optional(bool)
  }))
}
