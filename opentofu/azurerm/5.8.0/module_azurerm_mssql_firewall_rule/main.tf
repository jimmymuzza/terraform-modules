resource "azurerm_mssql_firewall_rule" "mssql_firewall_rules" {
  for_each = var.mssql_firewall_rules

  end_ip_address   = each.value.end_ip_address
  name             = each.value.name
  server_id        = each.value.server_id
  start_ip_address = each.value.start_ip_address
}
