resource "azurerm_api_management_identity_provider_aad" "api_management_identity_provider_aads" {
  for_each = var.api_management_identity_provider_aads

  allowed_tenants     = each.value.allowed_tenants
  api_management_name = each.value.api_management_name
  client_id           = each.value.client_id
  client_secret       = each.value.client_secret
  resource_group_name = each.value.resource_group_name
  client_library      = each.value.client_library
  signin_tenant       = each.value.signin_tenant
}
