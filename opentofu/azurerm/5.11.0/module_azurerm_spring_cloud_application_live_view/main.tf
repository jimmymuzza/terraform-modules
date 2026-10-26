resource "azurerm_spring_cloud_application_live_view" "spring_cloud_application_live_views" {
  for_each = var.spring_cloud_application_live_views

  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id
}
