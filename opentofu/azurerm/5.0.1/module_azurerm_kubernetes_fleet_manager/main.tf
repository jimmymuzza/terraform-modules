resource "azurerm_kubernetes_fleet_manager" "kubernetes_fleet_managers" {
  for_each = var.kubernetes_fleet_managers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "hub_profile" {
    for_each = each.value.hub_profile != null ? each.value.hub_profile : []
    content {
      dns_prefix = hub_profile.value.dns_prefix
    }
  }
}
