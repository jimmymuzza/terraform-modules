resource "azurerm_postgresql_flexible_server_configuration" "postgresql_flexible_server_configurations" {
  for_each = var.postgresql_flexible_server_configurations

  name      = each.value.name
  server_id = each.value.server_id
  value     = each.value.value
}
