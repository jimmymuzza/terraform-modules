resource "azurerm_api_management_certificate" "api_management_certificates" {
  for_each = var.api_management_certificates

  api_management_name          = each.value.api_management_name
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  data                         = each.value.data
  key_vault_identity_client_id = each.value.key_vault_identity_client_id
  key_vault_secret_id          = each.value.key_vault_secret_id
  password                     = each.value.password
}
