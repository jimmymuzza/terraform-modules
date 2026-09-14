resource "azurerm_oracle_autonomous_database_clone_from_backup" "oracle_autonomous_database_clone_from_backups" {
  for_each = var.oracle_autonomous_database_clone_from_backups

  admin_password                   = each.value.admin_password
  auto_scaling_enabled             = each.value.auto_scaling_enabled
  auto_scaling_for_storage_enabled = each.value.auto_scaling_for_storage_enabled
  backup_retention_period_in_days  = each.value.backup_retention_period_in_days
  character_set                    = each.value.character_set
  clone_type                       = each.value.clone_type
  compute_count                    = each.value.compute_count
  compute_model                    = each.value.compute_model
  data_storage_size_in_tb          = each.value.data_storage_size_in_tb
  database_version                 = each.value.database_version
  database_workload                = each.value.database_workload
  display_name                     = each.value.display_name
  license_model                    = each.value.license_model
  location                         = each.value.location
  mtls_connection_required         = each.value.mtls_connection_required
  name                             = each.value.name
  national_character_set           = each.value.national_character_set
  resource_group_name              = each.value.resource_group_name
  source_autonomous_database_id    = each.value.source_autonomous_database_id
  allowed_ip_addresses             = each.value.allowed_ip_addresses
  backup_timestamp                 = each.value.backup_timestamp
  customer_contacts                = each.value.customer_contacts
  subnet_id                        = each.value.subnet_id
  tags                             = each.value.tags
  virtual_network_id               = each.value.virtual_network_id
}
