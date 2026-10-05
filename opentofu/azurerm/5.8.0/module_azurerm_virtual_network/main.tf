resource "azurerm_virtual_network" "virtual_networks" {
  for_each = var.virtual_networks

  location                       = each.value.location
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  address_space                  = each.value.address_space
  bgp_community                  = each.value.bgp_community
  dns_servers                    = each.value.dns_servers
  edge_zone                      = each.value.edge_zone
  flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  subnet                         = each.value.subnet
  tags                           = each.value.tags

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? each.value.ddos_protection_plan : []
    content {
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []
    content {
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }
}
