resource "azurerm_mssql_database_extended_auditing_policy" "mssql_database_extended_auditing_policies" {
  for_each = var.mssql_database_extended_auditing_policies

  database_id                             = each.value.database_id
  blob_storage_endpoint                   = each.value.blob_storage_endpoint
  enabled                                 = each.value.enabled
  log_monitoring_enabled                  = each.value.log_monitoring_enabled
  retention_in_days                       = each.value.retention_in_days
  storage_account_access_key              = each.value.storage_account_access_key
  storage_account_access_key_is_secondary = each.value.storage_account_access_key_is_secondary
}
