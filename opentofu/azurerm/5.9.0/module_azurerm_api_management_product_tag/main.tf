resource "azurerm_api_management_product_tag" "api_management_product_tags" {
  for_each = var.api_management_product_tags

  api_management_name       = each.value.api_management_name
  api_management_product_id = each.value.api_management_product_id
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
}
