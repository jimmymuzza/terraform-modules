resource "azurerm_network_manager_routing_rule_collection" "network_manager_routing_rule_collections" {
  for_each = var.network_manager_routing_rule_collections

  name                          = each.value.name
  network_group_ids             = each.value.network_group_ids
  routing_configuration_id      = each.value.routing_configuration_id
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  description                   = each.value.description
}
