resource "azurerm_api_management_openid_connect_provider" "api_management_openid_connect_providers" {
  for_each = var.api_management_openid_connect_providers

  api_management_name = each.value.api_management_name
  client_id           = each.value.client_id
  client_secret       = each.value.client_secret
  display_name        = each.value.display_name
  metadata_endpoint   = each.value.metadata_endpoint
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
}
