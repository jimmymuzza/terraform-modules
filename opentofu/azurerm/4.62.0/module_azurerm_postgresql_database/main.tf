resource "azurerm_postgresql_database" "postgresql_databases" {
  for_each = var.postgresql_databases

  charset             = each.value.charset
  collation           = each.value.collation
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
}
