resource "azurerm_stack_hci_logical_network" "stack_hci_logical_networks" {
  for_each = var.stack_hci_logical_networks

  custom_location_id  = each.value.custom_location_id
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_switch_name = each.value.virtual_switch_name
  dns_servers         = each.value.dns_servers
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      ip_allocation_method = subnet.value.ip_allocation_method
      address_prefix       = subnet.value.address_prefix
      vlan_id              = subnet.value.vlan_id

      dynamic "ip_pool" {
        for_each = subnet.value.ip_pool != null ? subnet.value.ip_pool : []
        content {
          end   = ip_pool.value.end
          start = ip_pool.value.start
        }
      }

      dynamic "route" {
        for_each = subnet.value.route != null ? subnet.value.route : []
        content {
          address_prefix      = route.value.address_prefix
          next_hop_ip_address = route.value.next_hop_ip_address
          name                = route.value.name
        }
      }
    }
  }
}
