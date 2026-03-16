resource "azurerm_oracle_autonomous_database" "oracle_autonomous_databases" {
  for_each = var.oracle_autonomous_databases

  admin_password                   = each.value.admin_password
  auto_scaling_enabled             = each.value.auto_scaling_enabled
  auto_scaling_for_storage_enabled = each.value.auto_scaling_for_storage_enabled
  backup_retention_period_in_days  = each.value.backup_retention_period_in_days
  character_set                    = each.value.character_set
  compute_count                    = each.value.compute_count
  compute_model                    = each.value.compute_model
  data_storage_size_in_tbs         = each.value.data_storage_size_in_tbs
  db_version                       = each.value.db_version
  db_workload                      = each.value.db_workload
  display_name                     = each.value.display_name
  license_model                    = each.value.license_model
  location                         = each.value.location
  mtls_connection_required         = each.value.mtls_connection_required
  name                             = each.value.name
  national_character_set           = each.value.national_character_set
  resource_group_name              = each.value.resource_group_name
  allowed_ips                      = each.value.allowed_ips
  customer_contacts                = each.value.customer_contacts
  subnet_id                        = each.value.subnet_id
  tags                             = each.value.tags
  virtual_network_id               = each.value.virtual_network_id

  dynamic "long_term_backup_schedule" {
    for_each = each.value.long_term_backup_schedule != null ? each.value.long_term_backup_schedule : []
    content {
      enabled                  = long_term_backup_schedule.value.enabled
      repeat_cadence           = long_term_backup_schedule.value.repeat_cadence
      retention_period_in_days = long_term_backup_schedule.value.retention_period_in_days
      time_of_backup           = long_term_backup_schedule.value.time_of_backup
    }
  }
}
