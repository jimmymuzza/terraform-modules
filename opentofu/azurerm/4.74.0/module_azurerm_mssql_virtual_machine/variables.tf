variable "mssql_virtual_machines" {
  description = <<EOT
Map of mssql_virtual_machines, attributes below
Required:
    - virtual_machine_id
Optional:
    - r_services_enabled
    - sql_connectivity_port
    - sql_connectivity_type
    - sql_connectivity_update_password
    - sql_connectivity_update_username
    - sql_license_type
    - sql_virtual_machine_group_id
    - tags
    - assessment
    - auto_backup
    - auto_patching
    - key_vault_credential
    - sql_instance
    - storage_configuration
    - wsfc_domain_credential
EOT

  type = map(object({
    virtual_machine_id               = string
    r_services_enabled               = optional(bool)
    sql_connectivity_port            = optional(number)
    sql_connectivity_type            = optional(string)
    sql_connectivity_update_password = optional(string)
    sql_connectivity_update_username = optional(string)
    sql_license_type                 = optional(string)
    sql_virtual_machine_group_id     = optional(string)
    tags                             = optional(map(string))
    assessment                       = optional(list(object({
            enabled         = optional(bool)
            run_immediately = optional(bool)
            schedule        = optional(list(object({
                day_of_week        = string
                start_time         = string
                monthly_occurrence = optional(number)
                weekly_interval    = optional(number)
            })))
        })))
    auto_backup                      = optional(list(object({
            retention_period_in_days        = number
            storage_account_access_key      = string
            storage_blob_endpoint           = string
            encryption_enabled              = optional(bool)
            encryption_password             = optional(string)
            system_databases_backup_enabled = optional(bool)
            manual_schedule                 = optional(list(object({
                full_backup_frequency           = string
                full_backup_start_hour          = number
                full_backup_window_in_hours     = number
                log_backup_frequency_in_minutes = number
                days_of_week                    = optional(set(string))
            })))
        })))
    auto_patching                    = optional(list(object({
            day_of_week                            = string
            maintenance_window_duration_in_minutes = number
            maintenance_window_starting_hour       = number
        })))
    key_vault_credential             = optional(list(object({
            key_vault_url            = string
            name                     = string
            service_principal_name   = string
            service_principal_secret = string
        })))
    sql_instance                     = optional(list(object({
            adhoc_workloads_optimization_enabled = optional(bool)
            collation                            = optional(string)
            instant_file_initialization_enabled  = optional(bool)
            lock_pages_in_memory_enabled         = optional(bool)
            max_dop                              = optional(number)
            max_server_memory_mb                 = optional(number)
            min_server_memory_mb                 = optional(number)
        })))
    storage_configuration            = optional(list(object({
            disk_type                      = string
            storage_workload_type          = string
            system_db_on_data_disk_enabled = optional(bool)
            data_settings                  = optional(list(object({
                default_file_path = string
                luns              = list(number)
            })))
            log_settings                   = optional(list(object({
                default_file_path = string
                luns              = list(number)
            })))
            temp_db_settings               = optional(list(object({
                default_file_path      = string
                luns                   = list(number)
                data_file_count        = optional(number)
                data_file_growth_in_mb = optional(number)
                data_file_size_mb      = optional(number)
                log_file_growth_mb     = optional(number)
                log_file_size_mb       = optional(number)
            })))
        })))
    wsfc_domain_credential           = optional(list(object({
            cluster_bootstrap_account_password = string
            cluster_operator_account_password  = string
            sql_service_account_password       = string
        })))
  }))
}
