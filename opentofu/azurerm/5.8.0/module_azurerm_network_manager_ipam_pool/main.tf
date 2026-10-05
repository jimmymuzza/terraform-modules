resource "azurerm_network_manager_ipam_pool" "network_manager_ipam_pools" {
  for_each = var.network_manager_ipam_pools

  address_prefixes   = each.value.address_prefixes
  location           = each.value.location
  name               = each.value.name
  network_manager_id = each.value.network_manager_id
  description        = each.value.description
  display_name       = each.value.display_name
  parent_pool_name   = each.value.parent_pool_name
  tags               = each.value.tags
}
