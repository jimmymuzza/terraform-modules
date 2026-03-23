resource "azurerm_network_manager_management_group_connection" "network_manager_management_group_connections" {
  for_each = var.network_manager_management_group_connections

  management_group_id = each.value.management_group_id
  name                = each.value.name
  network_manager_id  = each.value.network_manager_id
  description         = each.value.description
}
