resource "azurerm_monitor_aad_diagnostic_setting" "monitor_aad_diagnostic_settings" {
  for_each = var.monitor_aad_diagnostic_settings

  name                           = each.value.name
  eventhub_authorization_rule_id = each.value.eventhub_authorization_rule_id
  eventhub_name                  = each.value.eventhub_name
  log_analytics_workspace_id     = each.value.log_analytics_workspace_id
  storage_account_id             = each.value.storage_account_id

  dynamic "enabled_log" {
    for_each = each.value.enabled_log != null ? each.value.enabled_log : []
    content {
      category = enabled_log.value.category

      dynamic "retention_policy" {
        for_each = enabled_log.value.retention_policy != null ? enabled_log.value.retention_policy : []
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }
    }
  }
}
