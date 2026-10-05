variable "mssql_databases" {
  description = <<EOT
Map of mssql_databases, attributes below
Required:
    - name
    - server_id
Optional:
    - auto_pause_delay_in_minutes
    - collation
    - create_mode
    - creation_source_database_id
    - elastic_pool_id
    - enclave_type
    - geo_backup_enabled
    - ledger_enabled
    - license_type
    - maintenance_configuration_name
    - max_size_gb
    - min_capacity
    - read_replica_count
    - read_scale
    - recover_database_id
    - recovery_point_id
    - restore_dropped_database_id
    - restore_long_term_retention_backup_id
    - restore_point_in_time
    - sample_name
    - secondary_type
    - sku_name
    - storage_account_type
    - tags
    - transparent_data_encryption_enabled
    - transparent_data_encryption_key_automatic_rotation_enabled
    - transparent_data_encryption_key_vault_key_id
    - zone_redundant
    - identity
    - import
    - long_term_retention_policy
    - short_term_retention_policy
    - threat_detection_policy
EOT

  type = map(object({
    name                                                       = string
    server_id                                                  = string
    auto_pause_delay_in_minutes                                = optional(number)
    collation                                                  = optional(string)
    create_mode                                                = optional(string)
    creation_source_database_id                                = optional(string)
    elastic_pool_id                                            = optional(string)
    enclave_type                                               = optional(string)
    geo_backup_enabled                                         = optional(bool)
    ledger_enabled                                             = optional(bool)
    license_type                                               = optional(string)
    maintenance_configuration_name                             = optional(string)
    max_size_gb                                                = optional(number)
    min_capacity                                               = optional(number)
    read_replica_count                                         = optional(number)
    read_scale                                                 = optional(bool)
    recover_database_id                                        = optional(string)
    recovery_point_id                                          = optional(string)
    restore_dropped_database_id                                = optional(string)
    restore_long_term_retention_backup_id                      = optional(string)
    restore_point_in_time                                      = optional(string)
    sample_name                                                = optional(string)
    secondary_type                                             = optional(string)
    sku_name                                                   = optional(string)
    storage_account_type                                       = optional(string)
    tags                                                       = optional(map(string))
    transparent_data_encryption_enabled                        = optional(bool)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool)
    transparent_data_encryption_key_vault_key_id               = optional(string)
    zone_redundant                                             = optional(bool)
    identity                                                   = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    import                                                     = optional(list(object({
            administrator_login          = string
            administrator_login_password = string
            authentication_type          = string
            storage_key                  = string
            storage_key_type             = string
            storage_uri                  = string
            storage_account_id           = optional(string)
        })))
    long_term_retention_policy                                 = optional(list(object({
            monthly_retention = optional(string)
            week_of_year      = optional(number)
            weekly_retention  = optional(string)
            yearly_retention  = optional(string)
        })))
    short_term_retention_policy                                = optional(list(object({
            retention_days           = number
            backup_interval_in_hours = optional(number)
        })))
    threat_detection_policy                                    = optional(list(object({
            disabled_alerts              = optional(set(string))
            email_account_admins_enabled = optional(bool)
            email_addresses              = optional(set(string))
            retention_days               = optional(number)
            state                        = optional(string)
            storage_account_access_key   = optional(string)
            storage_endpoint             = optional(string)
        })))
  }))
}
