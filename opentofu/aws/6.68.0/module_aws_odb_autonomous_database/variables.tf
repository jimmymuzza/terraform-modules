variable "odb_autonomous_databases" {
  description = <<EOT
Map of odb_autonomous_databases, attributes below
Optional:
    - admin_password
    - admin_password_wo
    - admin_password_wo_version
    - allowlisted_ips
    - auto_refresh_frequency_in_seconds
    - auto_refresh_point_lag_in_seconds
    - autonomous_maintenance_schedule_type
    - backup_retention_period_in_days
    - byol_compute_count_limit
    - character_set
    - compute_count
    - cpu_core_count
    - data_storage_size_in_gbs
    - data_storage_size_in_tbs
    - database_edition
    - db_name
    - db_version
    - db_workload
    - display_name
    - encryption_key_provider
    - is_auto_scaling_enabled
    - is_auto_scaling_for_storage_enabled
    - is_backup_retention_locked
    - is_local_data_guard_enabled
    - is_mtls_connection_required
    - is_refreshable_clone
    - kms_key_id
    - license_model
    - local_adg_auto_failover_max_data_loss_limit
    - ncharacter_set
    - odb_network_id
    - open_mode
    - permission_level
    - private_endpoint_ip
    - private_endpoint_label
    - refreshable_mode
    - region
    - resource_pool_leader_id
    - source
    - standby_allowlisted_ips
    - standby_allowlisted_ips_source
    - tags
    - time_of_auto_refresh_start
    - admin_password_source
    - customer_contacts_to_send_to_oci
    - db_tools_details
    - long_term_backup_schedule
    - resource_pool_summary
    - scheduled_operations
    - source_configuration
    - transportable_tablespace
EOT

  type = map(object({
    admin_password                              = optional(string)
    admin_password_wo                           = optional(string)
    admin_password_wo_version                   = optional(number)
    allowlisted_ips                             = optional(list(string))
    auto_refresh_frequency_in_seconds           = optional(number)
    auto_refresh_point_lag_in_seconds           = optional(number)
    autonomous_maintenance_schedule_type        = optional(string)
    backup_retention_period_in_days             = optional(number)
    byol_compute_count_limit                    = optional(number)
    character_set                               = optional(string)
    compute_count                               = optional(number)
    cpu_core_count                              = optional(number)
    data_storage_size_in_gbs                    = optional(number)
    data_storage_size_in_tbs                    = optional(number)
    database_edition                            = optional(string)
    db_name                                     = optional(string)
    db_version                                  = optional(string)
    db_workload                                 = optional(string)
    display_name                                = optional(string)
    encryption_key_provider                     = optional(string)
    is_auto_scaling_enabled                     = optional(bool)
    is_auto_scaling_for_storage_enabled         = optional(bool)
    is_backup_retention_locked                  = optional(bool)
    is_local_data_guard_enabled                 = optional(bool)
    is_mtls_connection_required                 = optional(bool)
    is_refreshable_clone                        = optional(bool)
    kms_key_id                                  = optional(string)
    license_model                               = optional(string)
    local_adg_auto_failover_max_data_loss_limit = optional(number)
    ncharacter_set                              = optional(string)
    odb_network_id                              = optional(string)
    open_mode                                   = optional(string)
    permission_level                            = optional(string)
    private_endpoint_ip                         = optional(string)
    private_endpoint_label                      = optional(string)
    refreshable_mode                            = optional(string)
    region                                      = optional(string)
    resource_pool_leader_id                     = optional(string)
    source                                      = optional(string)
    standby_allowlisted_ips                     = optional(list(string))
    standby_allowlisted_ips_source              = optional(string)
    tags                                        = optional(map(string))
    time_of_auto_refresh_start                  = optional(string)
    admin_password_source                       = optional(list(object({
            customer_managed_aws_secret = optional(list(object({
                external_id_type = string
                iam_role_arn     = string
                secret_arn       = string
            })))
        })))
    customer_contacts_to_send_to_oci            = optional(list(object({
            email = string
        })))
    db_tools_details                            = optional(list(object({
            compute_count            = optional(number)
            is_enabled               = optional(bool)
            max_idle_time_in_minutes = optional(number)
            name                     = optional(string)
        })))
    long_term_backup_schedule                   = optional(list(object({
            is_disabled              = optional(bool)
            repeat_cadence           = optional(string)
            retention_period_in_days = optional(number)
            time_of_backup           = optional(string)
        })))
    resource_pool_summary                       = optional(list(object({
            is_disabled              = optional(bool)
            pool_size                = optional(number)
            pool_storage_size_in_tbs = optional(number)
        })))
    scheduled_operations                        = optional(list(object({
            day_of_week          = string
            scheduled_start_time = optional(string)
            scheduled_stop_time  = optional(string)
        })))
    source_configuration                        = optional(list(object({
            clone_to_refreshable           = optional(list(object({
                source_autonomous_database_id     = string
                auto_refresh_frequency_in_seconds = optional(number)
                auto_refresh_point_lag_in_seconds = optional(number)
                clone_type                        = optional(string)
                open_mode                         = optional(string)
                refreshable_mode                  = optional(string)
                time_of_auto_refresh_start        = optional(string)
            })))
            cross_region_data_guard        = optional(list(object({
                source_autonomous_database_arn = string
            })))
            cross_region_disaster_recovery = optional(list(object({
                remote_disaster_recovery_type  = string
                source_autonomous_database_arn = string
                is_replicate_automatic_backups = optional(bool)
            })))
            database_clone                 = optional(list(object({
                clone_type                    = string
                source_autonomous_database_id = string
            })))
            point_in_time_restore          = optional(list(object({
                clone_type                            = string
                source_autonomous_database_id         = string
                clone_table_space_list                = optional(list(number))
                timestamp                             = optional(string)
                use_latest_available_backup_timestamp = optional(bool)
            })))
            restore_from_backup            = optional(list(object({
                autonomous_database_backup_id = string
                clone_type                    = string
                clone_table_space_list        = optional(list(number))
            })))
        })))
    transportable_tablespace                    = optional(list(object({
            tts_bundle_url = optional(string)
        })))
  }))
}
