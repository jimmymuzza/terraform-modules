resource "azurerm_mysql_flexible_server_configuration" "mysql_flexible_server_configurations" {
  for_each = var.mysql_flexible_server_configurations

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
  value               = each.value.value
}
