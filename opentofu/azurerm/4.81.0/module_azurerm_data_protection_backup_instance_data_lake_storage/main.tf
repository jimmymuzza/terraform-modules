resource "azurerm_data_protection_backup_instance_data_lake_storage" "data_protection_backup_instance_data_lake_storages" {
  for_each = var.data_protection_backup_instance_data_lake_storages

  backup_policy_data_lake_storage_id = each.value.backup_policy_data_lake_storage_id
  data_protection_backup_vault_id    = each.value.data_protection_backup_vault_id
  location                           = each.value.location
  name                               = each.value.name
  storage_account_id                 = each.value.storage_account_id
  storage_container_names            = each.value.storage_container_names
}
