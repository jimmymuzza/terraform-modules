resource "azurerm_storage_account_customer_managed_key" "storage_account_customer_managed_keys" {
  for_each = var.storage_account_customer_managed_keys

  key_vault_key_id             = each.value.key_vault_key_id
  storage_account_id           = each.value.storage_account_id
  federated_identity_client_id = each.value.federated_identity_client_id
  user_assigned_identity_id    = each.value.user_assigned_identity_id
}
