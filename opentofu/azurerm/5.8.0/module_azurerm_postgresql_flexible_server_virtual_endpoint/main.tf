resource "azurerm_postgresql_flexible_server_virtual_endpoint" "postgresql_flexible_server_virtual_endpoints" {
  for_each = var.postgresql_flexible_server_virtual_endpoints

  name              = each.value.name
  replica_server_id = each.value.replica_server_id
  source_server_id  = each.value.source_server_id
  type              = each.value.type
}
