resource "azurerm_synapse_workspace_extended_auditing_policy" "synapse_workspace_extended_auditing_policies" {
  for_each = var.synapse_workspace_extended_auditing_policies

  synapse_workspace_id                    = each.value.synapse_workspace_id
  log_monitoring_enabled                  = each.value.log_monitoring_enabled
  retention_in_days                       = each.value.retention_in_days
  storage_account_access_key              = each.value.storage_account_access_key
  storage_account_access_key_is_secondary = each.value.storage_account_access_key_is_secondary
  storage_endpoint                        = each.value.storage_endpoint
}
