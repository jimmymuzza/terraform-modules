resource "azurerm_data_protection_backup_instance_mysql_flexible_server" "data_protection_backup_instance_mysql_flexible_servers" {
  for_each = var.data_protection_backup_instance_mysql_flexible_servers

  backup_policy_id = each.value.backup_policy_id
  location         = each.value.location
  name             = each.value.name
  server_id        = each.value.server_id
  vault_id         = each.value.vault_id
}
