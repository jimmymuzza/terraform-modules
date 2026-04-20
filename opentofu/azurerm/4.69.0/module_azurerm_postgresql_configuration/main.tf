resource "azurerm_postgresql_configuration" "postgresql_configurations" {
  for_each = var.postgresql_configurations

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
  value               = each.value.value
}
