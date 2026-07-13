resource "azurerm_system_center_virtual_machine_manager_availability_set" "system_center_virtual_machine_manager_availability_sets" {
  for_each = var.system_center_virtual_machine_manager_availability_sets

  custom_location_id                              = each.value.custom_location_id
  location                                        = each.value.location
  name                                            = each.value.name
  resource_group_name                             = each.value.resource_group_name
  system_center_virtual_machine_manager_server_id = each.value.system_center_virtual_machine_manager_server_id
  tags                                            = each.value.tags
}
