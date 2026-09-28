resource "azurerm_servicebus_namespace_customer_managed_key" "servicebus_namespace_customer_managed_keys" {
  for_each = var.servicebus_namespace_customer_managed_keys

  key_vault_key_id                  = each.value.key_vault_key_id
  namespace_id                      = each.value.namespace_id
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
}
