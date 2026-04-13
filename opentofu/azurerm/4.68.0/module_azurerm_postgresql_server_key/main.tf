resource "azurerm_postgresql_server_key" "postgresql_server_keys" {
  for_each = var.postgresql_server_keys

  key_vault_key_id = each.value.key_vault_key_id
  server_id        = each.value.server_id
}
