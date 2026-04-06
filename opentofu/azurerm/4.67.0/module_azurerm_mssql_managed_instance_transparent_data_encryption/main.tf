resource "azurerm_mssql_managed_instance_transparent_data_encryption" "mssql_managed_instance_transparent_data_encryptions" {
  for_each = var.mssql_managed_instance_transparent_data_encryptions

  managed_instance_id   = each.value.managed_instance_id
  auto_rotation_enabled = each.value.auto_rotation_enabled
  key_vault_key_id      = each.value.key_vault_key_id
  managed_hsm_key_id    = each.value.managed_hsm_key_id
}
