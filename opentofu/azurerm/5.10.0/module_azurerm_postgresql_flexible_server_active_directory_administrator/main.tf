resource "azurerm_postgresql_flexible_server_active_directory_administrator" "postgresql_flexible_server_active_directory_administrators" {
  for_each = var.postgresql_flexible_server_active_directory_administrators

  object_id           = each.value.object_id
  principal_name      = each.value.principal_name
  principal_type      = each.value.principal_type
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
  tenant_id           = each.value.tenant_id
}
