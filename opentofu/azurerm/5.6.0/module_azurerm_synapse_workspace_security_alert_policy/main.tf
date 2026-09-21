resource "azurerm_synapse_workspace_security_alert_policy" "synapse_workspace_security_alert_policies" {
  for_each = var.synapse_workspace_security_alert_policies

  policy_state                 = each.value.policy_state
  synapse_workspace_id         = each.value.synapse_workspace_id
  disabled_alerts              = each.value.disabled_alerts
  email_account_admins_enabled = each.value.email_account_admins_enabled
  email_addresses              = each.value.email_addresses
  retention_days               = each.value.retention_days
  storage_account_access_key   = each.value.storage_account_access_key
  storage_endpoint             = each.value.storage_endpoint
}
