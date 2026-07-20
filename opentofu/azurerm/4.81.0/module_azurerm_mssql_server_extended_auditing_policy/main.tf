resource "azurerm_mssql_server_extended_auditing_policy" "mssql_server_extended_auditing_policies" {
  for_each = var.mssql_server_extended_auditing_policies

  server_id                               = each.value.server_id
  audit_actions_and_groups                = each.value.audit_actions_and_groups
  enabled                                 = each.value.enabled
  log_monitoring_enabled                  = each.value.log_monitoring_enabled
  predicate_expression                    = each.value.predicate_expression
  retention_in_days                       = each.value.retention_in_days
  storage_account_access_key              = each.value.storage_account_access_key
  storage_account_access_key_is_secondary = each.value.storage_account_access_key_is_secondary
  storage_account_subscription_id         = each.value.storage_account_subscription_id
  storage_endpoint                        = each.value.storage_endpoint
}
