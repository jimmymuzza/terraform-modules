resource "azurerm_eventhub_namespace_customer_managed_key" "eventhub_namespace_customer_managed_keys" {
  for_each = var.eventhub_namespace_customer_managed_keys

  eventhub_namespace_id             = each.value.eventhub_namespace_id
  key_vault_key_ids                 = each.value.key_vault_key_ids
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
  user_assigned_identity_id         = each.value.user_assigned_identity_id
}
