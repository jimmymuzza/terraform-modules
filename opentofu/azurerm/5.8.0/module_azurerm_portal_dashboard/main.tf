resource "azurerm_portal_dashboard" "portal_dashboards" {
  for_each = var.portal_dashboards

  dashboard_properties = each.value.dashboard_properties
  location             = each.value.location
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  tags                 = each.value.tags
}
