resource "azurerm_virtual_hub" "virtual_hubs" {
  for_each = var.virtual_hubs

  location                               = each.value.location
  name                                   = each.value.name
  resource_group_name                    = each.value.resource_group_name
  address_prefix                         = each.value.address_prefix
  branch_to_branch_traffic_enabled       = each.value.branch_to_branch_traffic_enabled
  hub_routing_preference                 = each.value.hub_routing_preference
  sku                                    = each.value.sku
  tags                                   = each.value.tags
  virtual_router_auto_scale_min_capacity = each.value.virtual_router_auto_scale_min_capacity
  virtual_wan_id                         = each.value.virtual_wan_id

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }
}
