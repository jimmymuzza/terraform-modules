resource "azurerm_api_management_identity_provider_google" "api_management_identity_provider_googles" {
  for_each = var.api_management_identity_provider_googles

  api_management_name = each.value.api_management_name
  client_id           = each.value.client_id
  client_secret       = each.value.client_secret
  resource_group_name = each.value.resource_group_name
}
