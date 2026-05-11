resource "azurerm_network_manager_routing_configuration" "network_manager_routing_configurations" {
  for_each = var.network_manager_routing_configurations

  name                   = each.value.name
  network_manager_id     = each.value.network_manager_id
  description            = each.value.description
  route_table_usage_mode = each.value.route_table_usage_mode
}
