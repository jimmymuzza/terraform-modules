resource "azurerm_maintenance_assignment_virtual_machine_scale_set" "maintenance_assignment_virtual_machine_scale_sets" {
  for_each = var.maintenance_assignment_virtual_machine_scale_sets

  location                     = each.value.location
  maintenance_configuration_id = each.value.maintenance_configuration_id
  virtual_machine_scale_set_id = each.value.virtual_machine_scale_set_id
}
