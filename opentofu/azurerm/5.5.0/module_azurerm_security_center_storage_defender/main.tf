resource "azurerm_security_center_storage_defender" "security_center_storage_defenders" {
  for_each = var.security_center_storage_defenders

  storage_account_id                          = each.value.storage_account_id
  malware_scanning_on_upload_cap_gb_per_month = each.value.malware_scanning_on_upload_cap_gb_per_month
  malware_scanning_on_upload_enabled          = each.value.malware_scanning_on_upload_enabled
  override_subscription_settings_enabled      = each.value.override_subscription_settings_enabled
  scan_results_event_grid_topic_id            = each.value.scan_results_event_grid_topic_id
  sensitive_data_discovery_enabled            = each.value.sensitive_data_discovery_enabled
}
