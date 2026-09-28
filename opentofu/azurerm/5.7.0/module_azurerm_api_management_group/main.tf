resource "azurerm_api_management_group" "api_management_groups" {
  for_each = var.api_management_groups

  api_management_name = each.value.api_management_name
  display_name        = each.value.display_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  external_id         = each.value.external_id
  type                = each.value.type
}
