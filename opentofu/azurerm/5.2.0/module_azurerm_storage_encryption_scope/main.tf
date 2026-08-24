resource "azurerm_storage_encryption_scope" "storage_encryption_scopes" {
  for_each = var.storage_encryption_scopes

  name                               = each.value.name
  source                             = each.value.source
  storage_account_id                 = each.value.storage_account_id
  infrastructure_encryption_required = each.value.infrastructure_encryption_required
  key_vault_key_id                   = each.value.key_vault_key_id
}
