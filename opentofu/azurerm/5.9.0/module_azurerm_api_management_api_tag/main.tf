resource "azurerm_api_management_api_tag" "api_management_api_tags" {
  for_each = var.api_management_api_tags

  api_id = each.value.api_id
  name   = each.value.name
}
