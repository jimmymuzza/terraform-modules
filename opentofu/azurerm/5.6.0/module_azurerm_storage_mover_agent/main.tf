resource "azurerm_storage_mover_agent" "storage_mover_agents" {
  for_each = var.storage_mover_agents

  arc_virtual_machine_id   = each.value.arc_virtual_machine_id
  arc_virtual_machine_uuid = each.value.arc_virtual_machine_uuid
  name                     = each.value.name
  storage_mover_id         = each.value.storage_mover_id
  description              = each.value.description
}
