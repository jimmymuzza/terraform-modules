resource "azurerm_network_manager_ipam_pool_static_cidr" "network_manager_ipam_pool_static_cidrs" {
  for_each = var.network_manager_ipam_pool_static_cidrs

  ipam_pool_id                       = each.value.ipam_pool_id
  name                               = each.value.name
  address_prefixes                   = each.value.address_prefixes
  number_of_ip_addresses_to_allocate = each.value.number_of_ip_addresses_to_allocate
}
