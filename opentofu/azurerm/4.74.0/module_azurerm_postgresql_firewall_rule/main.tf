resource "azurerm_postgresql_firewall_rule" "postgresql_firewall_rules" {
  for_each = var.postgresql_firewall_rules

  end_ip_address      = each.value.end_ip_address
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  server_name         = each.value.server_name
  start_ip_address    = each.value.start_ip_address
}
