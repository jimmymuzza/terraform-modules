resource "azurerm_data_factory_credential_user_managed_identity" "data_factory_credential_user_managed_identities" {
  for_each = var.data_factory_credential_user_managed_identities

  data_factory_id = each.value.data_factory_id
  identity_id     = each.value.identity_id
  name            = each.value.name
  annotations     = each.value.annotations
  description     = each.value.description
}
