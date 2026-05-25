resource "azurerm_spring_cloud_dynatrace_application_performance_monitoring" "spring_cloud_dynatrace_application_performance_monitorings" {
  for_each = var.spring_cloud_dynatrace_application_performance_monitorings

  connection_point        = each.value.connection_point
  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id
  tenant                  = each.value.tenant
  tenant_token            = each.value.tenant_token
  api_token               = each.value.api_token
  api_url                 = each.value.api_url
  environment_id          = each.value.environment_id
  globally_enabled        = each.value.globally_enabled
}
