resource "azurerm_datadog_monitor_sso_configuration" "datadog_monitor_sso_configurations" {
  for_each = var.datadog_monitor_sso_configurations

  datadog_monitor_id        = each.value.datadog_monitor_id
  enterprise_application_id = each.value.enterprise_application_id
  single_sign_on            = each.value.single_sign_on
  name                      = each.value.name
}
