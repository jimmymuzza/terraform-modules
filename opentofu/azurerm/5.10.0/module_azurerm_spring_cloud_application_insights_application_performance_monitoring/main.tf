resource "azurerm_spring_cloud_application_insights_application_performance_monitoring" "spring_cloud_application_insights_application_performance_monitorings" {
  for_each = var.spring_cloud_application_insights_application_performance_monitorings

  name                         = each.value.name
  spring_cloud_service_id      = each.value.spring_cloud_service_id
  connection_string            = each.value.connection_string
  globally_enabled             = each.value.globally_enabled
  role_instance                = each.value.role_instance
  role_name                    = each.value.role_name
  sampling_percentage          = each.value.sampling_percentage
  sampling_requests_per_second = each.value.sampling_requests_per_second
}
