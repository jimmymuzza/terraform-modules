resource "azurerm_api_management_product_group" "api_management_product_groups" {
  for_each = var.api_management_product_groups

  api_management_name = each.value.api_management_name
  group_name          = each.value.group_name
  product_id          = each.value.product_id
  resource_group_name = each.value.resource_group_name
}
