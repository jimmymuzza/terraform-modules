resource "azurerm_key_vault_managed_storage_account" "key_vault_managed_storage_accounts" {
  for_each = var.key_vault_managed_storage_accounts

  key_vault_id                 = each.value.key_vault_id
  name                         = each.value.name
  storage_account_id           = each.value.storage_account_id
  storage_account_key          = each.value.storage_account_key
  regenerate_key_automatically = each.value.regenerate_key_automatically
  regeneration_period          = each.value.regeneration_period
  tags                         = each.value.tags
}
