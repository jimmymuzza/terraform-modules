resource "azurerm_virtual_machine_automanage_configuration_assignment" "virtual_machine_automanage_configuration_assignments" {
  for_each = var.virtual_machine_automanage_configuration_assignments

  configuration_id   = each.value.configuration_id
  virtual_machine_id = each.value.virtual_machine_id
}
