resource "azurerm_arc_machine_automanage_configuration_assignment" "arc_machine_automanage_configuration_assignments" {
  for_each = var.arc_machine_automanage_configuration_assignments

  arc_machine_id   = each.value.arc_machine_id
  configuration_id = each.value.configuration_id
}
