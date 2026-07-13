resource "azurerm_spring_cloud_elastic_application_performance_monitoring" "spring_cloud_elastic_application_performance_monitorings" {
  for_each = var.spring_cloud_elastic_application_performance_monitorings

  application_packages    = each.value.application_packages
  name                    = each.value.name
  server_url              = each.value.server_url
  service_name            = each.value.service_name
  spring_cloud_service_id = each.value.spring_cloud_service_id
  globally_enabled        = each.value.globally_enabled
}
