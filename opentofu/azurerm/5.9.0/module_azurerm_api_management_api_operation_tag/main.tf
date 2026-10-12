resource "azurerm_api_management_api_operation_tag" "api_management_api_operation_tags" {
  for_each = var.api_management_api_operation_tags

  api_operation_id = each.value.api_operation_id
  display_name     = each.value.display_name
  name             = each.value.name
}
