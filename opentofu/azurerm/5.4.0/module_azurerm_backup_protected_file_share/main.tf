resource "azurerm_backup_protected_file_share" "backup_protected_file_shares" {
  for_each = var.backup_protected_file_shares

  backup_policy_id          = each.value.backup_policy_id
  recovery_vault_name       = each.value.recovery_vault_name
  resource_group_name       = each.value.resource_group_name
  source_file_share_name    = each.value.source_file_share_name
  source_storage_account_id = each.value.source_storage_account_id
}
