resource "azurerm_machine_learning_workspace_network_outbound_rule_service_tag" "machine_learning_workspace_network_outbound_rule_service_tags" {
  for_each = var.machine_learning_workspace_network_outbound_rule_service_tags

  name         = each.value.name
  port_ranges  = each.value.port_ranges
  protocol     = each.value.protocol
  service_tag  = each.value.service_tag
  workspace_id = each.value.workspace_id
}
