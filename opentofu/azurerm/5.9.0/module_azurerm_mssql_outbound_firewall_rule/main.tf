resource "azurerm_mssql_outbound_firewall_rule" "mssql_outbound_firewall_rules" {
  for_each = var.mssql_outbound_firewall_rules

  name      = each.value.name
  server_id = each.value.server_id
}
