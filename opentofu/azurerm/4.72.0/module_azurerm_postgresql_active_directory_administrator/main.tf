resource "azurerm_postgresql_active_directory_administrator" "postgresql_active_directory_administrators" {
  for_each = var.postgresql_active_directory_administrators

  login               = each.value.login
  object_id           = each.value.object_id
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
  tenant_id           = each.value.tenant_id
}
