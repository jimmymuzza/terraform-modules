resource "azurerm_storage_account_customer_managed_key" "storage_account_customer_managed_keys" {
  for_each = var.storage_account_customer_managed_keys

  storage_account_id           = each.value.storage_account_id
  federated_identity_client_id = each.value.federated_identity_client_id
  key_name                     = each.value.key_name
  key_vault_id                 = each.value.key_vault_id
  key_vault_key_id             = each.value.key_vault_key_id
  key_vault_uri                = each.value.key_vault_uri
  key_version                  = each.value.key_version
  managed_hsm_key_id           = each.value.managed_hsm_key_id
  user_assigned_identity_id    = each.value.user_assigned_identity_id
}
