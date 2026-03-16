resource "azurerm_data_protection_backup_instance_postgresql" "data_protection_backup_instance_postgresqls" {
  for_each = var.data_protection_backup_instance_postgresqls

  backup_policy_id                        = each.value.backup_policy_id
  database_id                             = each.value.database_id
  location                                = each.value.location
  name                                    = each.value.name
  vault_id                                = each.value.vault_id
  database_credential_key_vault_secret_id = each.value.database_credential_key_vault_secret_id
}
