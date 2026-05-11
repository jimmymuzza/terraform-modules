resource "azurerm_maintenance_assignment_virtual_machine" "maintenance_assignment_virtual_machines" {
  for_each = var.maintenance_assignment_virtual_machines

  location                     = each.value.location
  maintenance_configuration_id = each.value.maintenance_configuration_id
  virtual_machine_id           = each.value.virtual_machine_id
}
