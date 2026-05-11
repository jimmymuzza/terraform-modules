resource "azurerm_synapse_firewall_rule" "synapse_firewall_rules" {
  for_each = var.synapse_firewall_rules

  end_ip_address       = each.value.end_ip_address
  name                 = each.value.name
  start_ip_address     = each.value.start_ip_address
  synapse_workspace_id = each.value.synapse_workspace_id
}
