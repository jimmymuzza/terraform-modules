resource "azurerm_mssql_server_transparent_data_encryption" "mssql_server_transparent_data_encryptions" {
  for_each = var.mssql_server_transparent_data_encryptions

  server_id             = each.value.server_id
  auto_rotation_enabled = each.value.auto_rotation_enabled
  key_vault_key_id      = each.value.key_vault_key_id
  managed_hsm_key_id    = each.value.managed_hsm_key_id
}
