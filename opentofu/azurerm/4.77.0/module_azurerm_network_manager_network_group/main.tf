resource "azurerm_network_manager_network_group" "network_manager_network_groups" {
  for_each = var.network_manager_network_groups

  name               = each.value.name
  network_manager_id = each.value.network_manager_id
  description        = each.value.description
  member_type        = each.value.member_type
}
