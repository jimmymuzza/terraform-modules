resource "azurerm_system_center_virtual_machine_manager_virtual_network" "system_center_virtual_machine_manager_virtual_networks" {
  for_each = var.system_center_virtual_machine_manager_virtual_networks

  custom_location_id                                             = each.value.custom_location_id
  location                                                       = each.value.location
  name                                                           = each.value.name
  resource_group_name                                            = each.value.resource_group_name
  system_center_virtual_machine_manager_server_inventory_item_id = each.value.system_center_virtual_machine_manager_server_inventory_item_id
  tags                                                           = each.value.tags
}
