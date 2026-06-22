resource "azurerm_api_connection" "api_connections" {
  for_each = var.api_connections

  managed_api_id      = each.value.managed_api_id
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  display_name        = each.value.display_name
  parameter_values    = each.value.parameter_values
  tags                = each.value.tags
}
