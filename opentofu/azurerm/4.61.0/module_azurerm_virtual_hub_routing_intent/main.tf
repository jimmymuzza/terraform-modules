resource "azurerm_virtual_hub_routing_intent" "virtual_hub_routing_intents" {
  for_each = var.virtual_hub_routing_intents

  name           = each.value.name
  virtual_hub_id = each.value.virtual_hub_id

  dynamic "routing_policy" {
    for_each = each.value.routing_policy != null ? each.value.routing_policy : []
    content {
      destinations = routing_policy.value.destinations
      name         = routing_policy.value.name
      next_hop     = routing_policy.value.next_hop
    }
  }
}
