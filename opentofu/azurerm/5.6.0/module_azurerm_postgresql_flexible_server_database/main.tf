resource "azurerm_postgresql_flexible_server_database" "postgresql_flexible_server_databases" {
  for_each = var.postgresql_flexible_server_databases

  name      = each.value.name
  server_id = each.value.server_id
  charset   = each.value.charset
  collation = each.value.collation
}
