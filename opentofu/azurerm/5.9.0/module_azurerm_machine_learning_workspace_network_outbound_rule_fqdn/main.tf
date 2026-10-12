resource "azurerm_machine_learning_workspace_network_outbound_rule_fqdn" "machine_learning_workspace_network_outbound_rule_fqdns" {
  for_each = var.machine_learning_workspace_network_outbound_rule_fqdns

  destination_fqdn = each.value.destination_fqdn
  name             = each.value.name
  workspace_id     = each.value.workspace_id
}
