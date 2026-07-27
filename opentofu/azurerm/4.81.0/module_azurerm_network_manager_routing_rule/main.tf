resource "azurerm_network_manager_routing_rule" "network_manager_routing_rules" {
  for_each = var.network_manager_routing_rules

  name               = each.value.name
  rule_collection_id = each.value.rule_collection_id
  description        = each.value.description

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {
      address = destination.value.address
      type    = destination.value.type
    }
  }

  dynamic "next_hop" {
    for_each = each.value.next_hop != null ? each.value.next_hop : []
    content {
      type    = next_hop.value.type
      address = next_hop.value.address
    }
  }
}
