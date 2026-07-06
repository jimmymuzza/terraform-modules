resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel_log_analytics_workspace_onboardings" {
  for_each = var.sentinel_log_analytics_workspace_onboardings

  workspace_id                 = each.value.workspace_id
  customer_managed_key_enabled = each.value.customer_managed_key_enabled
}
