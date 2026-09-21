resource "azurerm_api_management_tag" "api_management_tags" {
  for_each = var.api_management_tags

  api_management_id = each.value.api_management_id
  name              = each.value.name
  display_name      = each.value.display_name
}
