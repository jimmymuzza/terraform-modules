resource "azurerm_system_center_virtual_machine_manager_virtual_machine_template" "system_center_virtual_machine_manager_virtual_machine_templates" {
  for_each = var.system_center_virtual_machine_manager_virtual_machine_templates

  custom_location_id                                             = each.value.custom_location_id
  location                                                       = each.value.location
  name                                                           = each.value.name
  resource_group_name                                            = each.value.resource_group_name
  system_center_virtual_machine_manager_server_inventory_item_id = each.value.system_center_virtual_machine_manager_server_inventory_item_id
  tags                                                           = each.value.tags
}
