resource "azurerm_cognitive_account_customer_managed_key" "cognitive_account_customer_managed_keys" {
  for_each = var.cognitive_account_customer_managed_keys

  cognitive_account_id = each.value.cognitive_account_id
  key_vault_key_id     = each.value.key_vault_key_id
  identity_client_id   = each.value.identity_client_id
}
