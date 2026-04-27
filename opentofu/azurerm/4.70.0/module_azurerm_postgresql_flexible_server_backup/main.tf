resource "azurerm_postgresql_flexible_server_backup" "postgresql_flexible_server_backups" {
  for_each = var.postgresql_flexible_server_backups

  name      = each.value.name
  server_id = each.value.server_id
}
