resource "azurerm_dashboard_grafana_managed_private_endpoint" "dashboard_grafana_managed_private_endpoints" {
  for_each = var.dashboard_grafana_managed_private_endpoints

  grafana_id                   = each.value.grafana_id
  location                     = each.value.location
  name                         = each.value.name
  private_link_resource_id     = each.value.private_link_resource_id
  group_ids                    = each.value.group_ids
  private_link_resource_region = each.value.private_link_resource_region
  private_link_service_url     = each.value.private_link_service_url
  request_message              = each.value.request_message
  tags                         = each.value.tags
}
