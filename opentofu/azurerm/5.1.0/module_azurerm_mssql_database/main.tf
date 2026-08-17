resource "azurerm_mssql_database" "mssql_databases" {
  for_each = var.mssql_databases

  name                                                       = each.value.name
  server_id                                                  = each.value.server_id
  auto_pause_delay_in_minutes                                = each.value.auto_pause_delay_in_minutes
  collation                                                  = each.value.collation
  create_mode                                                = each.value.create_mode
  creation_source_database_id                                = each.value.creation_source_database_id
  elastic_pool_id                                            = each.value.elastic_pool_id
  enclave_type                                               = each.value.enclave_type
  geo_backup_enabled                                         = each.value.geo_backup_enabled
  ledger_enabled                                             = each.value.ledger_enabled
  license_type                                               = each.value.license_type
  maintenance_configuration_name                             = each.value.maintenance_configuration_name
  max_size_gb                                                = each.value.max_size_gb
  min_capacity                                               = each.value.min_capacity
  read_replica_count                                         = each.value.read_replica_count
  read_scale                                                 = each.value.read_scale
  recover_database_id                                        = each.value.recover_database_id
  recovery_point_id                                          = each.value.recovery_point_id
  restore_dropped_database_id                                = each.value.restore_dropped_database_id
  restore_long_term_retention_backup_id                      = each.value.restore_long_term_retention_backup_id
  restore_point_in_time                                      = each.value.restore_point_in_time
  sample_name                                                = each.value.sample_name
  secondary_type                                             = each.value.secondary_type
  sku_name                                                   = each.value.sku_name
  storage_account_type                                       = each.value.storage_account_type
  tags                                                       = each.value.tags
  transparent_data_encryption_enabled                        = each.value.transparent_data_encryption_enabled
  transparent_data_encryption_key_automatic_rotation_enabled = each.value.transparent_data_encryption_key_automatic_rotation_enabled
  transparent_data_encryption_key_vault_key_id               = each.value.transparent_data_encryption_key_vault_key_id
  zone_redundant                                             = each.value.zone_redundant

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "import" {
    for_each = each.value.import != null ? each.value.import : []
    content {
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      storage_uri                  = import.value.storage_uri
      storage_account_id           = import.value.storage_account_id
    }
  }

  dynamic "long_term_retention_policy" {
    for_each = each.value.long_term_retention_policy != null ? each.value.long_term_retention_policy : []
    content {
      monthly_retention = long_term_retention_policy.value.monthly_retention
      week_of_year      = long_term_retention_policy.value.week_of_year
      weekly_retention  = long_term_retention_policy.value.weekly_retention
      yearly_retention  = long_term_retention_policy.value.yearly_retention
    }
  }

  dynamic "short_term_retention_policy" {
    for_each = each.value.short_term_retention_policy != null ? each.value.short_term_retention_policy : []
    content {
      retention_days           = short_term_retention_policy.value.retention_days
      backup_interval_in_hours = short_term_retention_policy.value.backup_interval_in_hours
    }
  }

  dynamic "threat_detection_policy" {
    for_each = each.value.threat_detection_policy != null ? each.value.threat_detection_policy : []
    content {
      disabled_alerts              = threat_detection_policy.value.disabled_alerts
      email_account_admins_enabled = threat_detection_policy.value.email_account_admins_enabled
      email_addresses              = threat_detection_policy.value.email_addresses
      retention_days               = threat_detection_policy.value.retention_days
      state                        = threat_detection_policy.value.state
      storage_account_access_key   = threat_detection_policy.value.storage_account_access_key
      storage_endpoint             = threat_detection_policy.value.storage_endpoint
    }
  }
}
