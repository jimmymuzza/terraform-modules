resource "azurerm_mssql_managed_instance_security_alert_policy" "mssql_managed_instance_security_alert_policies" {
  for_each = var.mssql_managed_instance_security_alert_policies

  managed_instance_name        = each.value.managed_instance_name
  resource_group_name          = each.value.resource_group_name
  disabled_alerts              = each.value.disabled_alerts
  email_account_admins_enabled = each.value.email_account_admins_enabled
  email_addresses              = each.value.email_addresses
  enabled                      = each.value.enabled
  retention_days               = each.value.retention_days
  storage_account_access_key   = each.value.storage_account_access_key
  storage_endpoint             = each.value.storage_endpoint
}
