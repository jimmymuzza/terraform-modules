resource "azurerm_mysql_flexible_server_active_directory_administrator" "mysql_flexible_server_active_directory_administrators" {
  for_each = var.mysql_flexible_server_active_directory_administrators

  identity_id = each.value.identity_id
  login       = each.value.login
  object_id   = each.value.object_id
  server_id   = each.value.server_id
  tenant_id   = each.value.tenant_id
}
