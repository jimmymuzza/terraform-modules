resource "azurerm_route_server" "route_servers" {
  for_each = var.route_servers

  location                         = each.value.location
  name                             = each.value.name
  public_ip_address_id             = each.value.public_ip_address_id
  resource_group_name              = each.value.resource_group_name
  sku                              = each.value.sku
  subnet_id                        = each.value.subnet_id
  branch_to_branch_traffic_enabled = each.value.branch_to_branch_traffic_enabled
  hub_routing_preference           = each.value.hub_routing_preference
  tags                             = each.value.tags
}
