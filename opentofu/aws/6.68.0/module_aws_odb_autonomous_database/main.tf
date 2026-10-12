resource "aws_odb_autonomous_database" "odb_autonomous_databases" {
  for_each = var.odb_autonomous_databases

  admin_password                              = each.value.admin_password
  admin_password_wo                           = each.value.admin_password_wo
  admin_password_wo_version                   = each.value.admin_password_wo_version
  allowlisted_ips                             = each.value.allowlisted_ips
  auto_refresh_frequency_in_seconds           = each.value.auto_refresh_frequency_in_seconds
  auto_refresh_point_lag_in_seconds           = each.value.auto_refresh_point_lag_in_seconds
  autonomous_maintenance_schedule_type        = each.value.autonomous_maintenance_schedule_type
  backup_retention_period_in_days             = each.value.backup_retention_period_in_days
  byol_compute_count_limit                    = each.value.byol_compute_count_limit
  character_set                               = each.value.character_set
  compute_count                               = each.value.compute_count
  cpu_core_count                              = each.value.cpu_core_count
  data_storage_size_in_gbs                    = each.value.data_storage_size_in_gbs
  data_storage_size_in_tbs                    = each.value.data_storage_size_in_tbs
  database_edition                            = each.value.database_edition
  db_name                                     = each.value.db_name
  db_version                                  = each.value.db_version
  db_workload                                 = each.value.db_workload
  display_name                                = each.value.display_name
  encryption_key_provider                     = each.value.encryption_key_provider
  is_auto_scaling_enabled                     = each.value.is_auto_scaling_enabled
  is_auto_scaling_for_storage_enabled         = each.value.is_auto_scaling_for_storage_enabled
  is_backup_retention_locked                  = each.value.is_backup_retention_locked
  is_local_data_guard_enabled                 = each.value.is_local_data_guard_enabled
  is_mtls_connection_required                 = each.value.is_mtls_connection_required
  is_refreshable_clone                        = each.value.is_refreshable_clone
  kms_key_id                                  = each.value.kms_key_id
  license_model                               = each.value.license_model
  local_adg_auto_failover_max_data_loss_limit = each.value.local_adg_auto_failover_max_data_loss_limit
  ncharacter_set                              = each.value.ncharacter_set
  odb_network_id                              = each.value.odb_network_id
  open_mode                                   = each.value.open_mode
  permission_level                            = each.value.permission_level
  private_endpoint_ip                         = each.value.private_endpoint_ip
  private_endpoint_label                      = each.value.private_endpoint_label
  refreshable_mode                            = each.value.refreshable_mode
  region                                      = each.value.region
  resource_pool_leader_id                     = each.value.resource_pool_leader_id
  source                                      = each.value.source
  standby_allowlisted_ips                     = each.value.standby_allowlisted_ips
  standby_allowlisted_ips_source              = each.value.standby_allowlisted_ips_source
  tags                                        = each.value.tags
  time_of_auto_refresh_start                  = each.value.time_of_auto_refresh_start

  dynamic "admin_password_source" {
    for_each = each.value.admin_password_source != null ? each.value.admin_password_source : []
    content {

      dynamic "customer_managed_aws_secret" {
        for_each = admin_password_source.value.customer_managed_aws_secret != null ? admin_password_source.value.customer_managed_aws_secret : []
        content {
          external_id_type = customer_managed_aws_secret.value.external_id_type
          iam_role_arn     = customer_managed_aws_secret.value.iam_role_arn
          secret_arn       = customer_managed_aws_secret.value.secret_arn
        }
      }
    }
  }

  dynamic "customer_contacts_to_send_to_oci" {
    for_each = each.value.customer_contacts_to_send_to_oci != null ? each.value.customer_contacts_to_send_to_oci : []
    content {
      email = customer_contacts_to_send_to_oci.value.email
    }
  }

  dynamic "db_tools_details" {
    for_each = each.value.db_tools_details != null ? each.value.db_tools_details : []
    content {
      compute_count            = db_tools_details.value.compute_count
      is_enabled               = db_tools_details.value.is_enabled
      max_idle_time_in_minutes = db_tools_details.value.max_idle_time_in_minutes
      name                     = db_tools_details.value.name
    }
  }

  dynamic "long_term_backup_schedule" {
    for_each = each.value.long_term_backup_schedule != null ? each.value.long_term_backup_schedule : []
    content {
      is_disabled              = long_term_backup_schedule.value.is_disabled
      repeat_cadence           = long_term_backup_schedule.value.repeat_cadence
      retention_period_in_days = long_term_backup_schedule.value.retention_period_in_days
      time_of_backup           = long_term_backup_schedule.value.time_of_backup
    }
  }

  dynamic "resource_pool_summary" {
    for_each = each.value.resource_pool_summary != null ? each.value.resource_pool_summary : []
    content {
      is_disabled              = resource_pool_summary.value.is_disabled
      pool_size                = resource_pool_summary.value.pool_size
      pool_storage_size_in_tbs = resource_pool_summary.value.pool_storage_size_in_tbs
    }
  }

  dynamic "scheduled_operations" {
    for_each = each.value.scheduled_operations != null ? each.value.scheduled_operations : []
    content {
      day_of_week          = scheduled_operations.value.day_of_week
      scheduled_start_time = scheduled_operations.value.scheduled_start_time
      scheduled_stop_time  = scheduled_operations.value.scheduled_stop_time
    }
  }

  dynamic "source_configuration" {
    for_each = each.value.source_configuration != null ? each.value.source_configuration : []
    content {

      dynamic "clone_to_refreshable" {
        for_each = source_configuration.value.clone_to_refreshable != null ? source_configuration.value.clone_to_refreshable : []
        content {
          source_autonomous_database_id     = clone_to_refreshable.value.source_autonomous_database_id
          auto_refresh_frequency_in_seconds = clone_to_refreshable.value.auto_refresh_frequency_in_seconds
          auto_refresh_point_lag_in_seconds = clone_to_refreshable.value.auto_refresh_point_lag_in_seconds
          clone_type                        = clone_to_refreshable.value.clone_type
          open_mode                         = clone_to_refreshable.value.open_mode
          refreshable_mode                  = clone_to_refreshable.value.refreshable_mode
          time_of_auto_refresh_start        = clone_to_refreshable.value.time_of_auto_refresh_start
        }
      }

      dynamic "cross_region_data_guard" {
        for_each = source_configuration.value.cross_region_data_guard != null ? source_configuration.value.cross_region_data_guard : []
        content {
          source_autonomous_database_arn = cross_region_data_guard.value.source_autonomous_database_arn
        }
      }

      dynamic "cross_region_disaster_recovery" {
        for_each = source_configuration.value.cross_region_disaster_recovery != null ? source_configuration.value.cross_region_disaster_recovery : []
        content {
          remote_disaster_recovery_type  = cross_region_disaster_recovery.value.remote_disaster_recovery_type
          source_autonomous_database_arn = cross_region_disaster_recovery.value.source_autonomous_database_arn
          is_replicate_automatic_backups = cross_region_disaster_recovery.value.is_replicate_automatic_backups
        }
      }

      dynamic "database_clone" {
        for_each = source_configuration.value.database_clone != null ? source_configuration.value.database_clone : []
        content {
          clone_type                    = database_clone.value.clone_type
          source_autonomous_database_id = database_clone.value.source_autonomous_database_id
        }
      }

      dynamic "point_in_time_restore" {
        for_each = source_configuration.value.point_in_time_restore != null ? source_configuration.value.point_in_time_restore : []
        content {
          clone_type                            = point_in_time_restore.value.clone_type
          source_autonomous_database_id         = point_in_time_restore.value.source_autonomous_database_id
          clone_table_space_list                = point_in_time_restore.value.clone_table_space_list
          timestamp                             = point_in_time_restore.value.timestamp
          use_latest_available_backup_timestamp = point_in_time_restore.value.use_latest_available_backup_timestamp
        }
      }

      dynamic "restore_from_backup" {
        for_each = source_configuration.value.restore_from_backup != null ? source_configuration.value.restore_from_backup : []
        content {
          autonomous_database_backup_id = restore_from_backup.value.autonomous_database_backup_id
          clone_type                    = restore_from_backup.value.clone_type
          clone_table_space_list        = restore_from_backup.value.clone_table_space_list
        }
      }
    }
  }

  dynamic "transportable_tablespace" {
    for_each = each.value.transportable_tablespace != null ? each.value.transportable_tablespace : []
    content {
      tts_bundle_url = transportable_tablespace.value.tts_bundle_url
    }
  }
}
