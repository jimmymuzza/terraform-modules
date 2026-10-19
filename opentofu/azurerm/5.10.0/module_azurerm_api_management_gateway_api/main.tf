resource "azurerm_api_management_gateway_api" "api_management_gateway_apis" {
  for_each = var.api_management_gateway_apis

  api_id     = each.value.api_id
  gateway_id = each.value.gateway_id
}
