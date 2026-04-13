resource "azurerm_spring_cloud_new_relic_application_performance_monitoring" "spring_cloud_new_relic_application_performance_monitorings" {
  for_each = var.spring_cloud_new_relic_application_performance_monitorings

  app_name                        = each.value.app_name
  license_key                     = each.value.license_key
  name                            = each.value.name
  spring_cloud_service_id         = each.value.spring_cloud_service_id
  agent_enabled                   = each.value.agent_enabled
  app_server_port                 = each.value.app_server_port
  audit_mode_enabled              = each.value.audit_mode_enabled
  auto_app_naming_enabled         = each.value.auto_app_naming_enabled
  auto_transaction_naming_enabled = each.value.auto_transaction_naming_enabled
  custom_tracing_enabled          = each.value.custom_tracing_enabled
  globally_enabled                = each.value.globally_enabled
  labels                          = each.value.labels
}
