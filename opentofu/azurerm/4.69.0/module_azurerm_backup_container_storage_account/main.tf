resource "azurerm_backup_container_storage_account" "backup_container_storage_accounts" {
  for_each = var.backup_container_storage_accounts

  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.resource_group_name
  storage_account_id  = each.value.storage_account_id
}
