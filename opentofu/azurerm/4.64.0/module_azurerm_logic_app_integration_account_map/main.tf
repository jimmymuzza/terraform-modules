resource "azurerm_logic_app_integration_account_map" "logic_app_integration_account_maps" {
  for_each = var.logic_app_integration_account_maps

  content                  = each.value.content
  integration_account_name = each.value.integration_account_name
  map_type                 = each.value.map_type
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata
}
