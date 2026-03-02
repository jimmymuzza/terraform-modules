resource "azurerm_network_manager_static_member" "network_manager_static_members" {
  for_each = var.network_manager_static_members

  name                      = each.value.name
  network_group_id          = each.value.network_group_id
  target_virtual_network_id = each.value.target_virtual_network_id
}
