resource "azurerm_api_management_identity_provider_twitter" "api_management_identity_provider_twitters" {
  for_each = var.api_management_identity_provider_twitters

  api_key             = each.value.api_key
  api_management_name = each.value.api_management_name
  api_secret_key      = each.value.api_secret_key
  resource_group_name = each.value.resource_group_name
}
