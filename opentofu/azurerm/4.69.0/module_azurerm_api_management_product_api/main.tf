resource "azurerm_api_management_product_api" "api_management_product_apis" {
  for_each = var.api_management_product_apis

  api_management_name = each.value.api_management_name
  api_name            = each.value.api_name
  product_id          = each.value.product_id
  resource_group_name = each.value.resource_group_name
}
