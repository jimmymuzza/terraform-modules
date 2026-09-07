resource "azurerm_data_factory_customer_managed_key" "data_factory_customer_managed_keys" {
  for_each = var.data_factory_customer_managed_keys

  customer_managed_key_id   = each.value.customer_managed_key_id
  data_factory_id           = each.value.data_factory_id
  user_assigned_identity_id = each.value.user_assigned_identity_id
}
