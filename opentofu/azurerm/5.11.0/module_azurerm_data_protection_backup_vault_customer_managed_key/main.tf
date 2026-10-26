resource "azurerm_data_protection_backup_vault_customer_managed_key" "data_protection_backup_vault_customer_managed_keys" {
  for_each = var.data_protection_backup_vault_customer_managed_keys

  data_protection_backup_vault_id = each.value.data_protection_backup_vault_id
  key_vault_key_id                = each.value.key_vault_key_id
}
