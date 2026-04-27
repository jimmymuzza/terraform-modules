resource "azurerm_mssql_server_microsoft_support_auditing_policy" "mssql_server_microsoft_support_auditing_policies" {
  for_each = var.mssql_server_microsoft_support_auditing_policies

  server_id                       = each.value.server_id
  blob_storage_endpoint           = each.value.blob_storage_endpoint
  enabled                         = each.value.enabled
  log_monitoring_enabled          = each.value.log_monitoring_enabled
  storage_account_access_key      = each.value.storage_account_access_key
  storage_account_subscription_id = each.value.storage_account_subscription_id
}
