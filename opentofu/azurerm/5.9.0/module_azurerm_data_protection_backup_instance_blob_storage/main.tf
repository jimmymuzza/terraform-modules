resource "azurerm_data_protection_backup_instance_blob_storage" "data_protection_backup_instance_blob_storages" {
  for_each = var.data_protection_backup_instance_blob_storages

  backup_policy_id                = each.value.backup_policy_id
  location                        = each.value.location
  name                            = each.value.name
  storage_account_id              = each.value.storage_account_id
  vault_id                        = each.value.vault_id
  storage_account_container_names = each.value.storage_account_container_names
}
