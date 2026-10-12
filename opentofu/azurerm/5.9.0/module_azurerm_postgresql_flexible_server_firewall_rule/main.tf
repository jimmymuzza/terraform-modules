resource "azurerm_postgresql_flexible_server_firewall_rule" "postgresql_flexible_server_firewall_rules" {
  for_each = var.postgresql_flexible_server_firewall_rules

  end_ip_address   = each.value.end_ip_address
  name             = each.value.name
  server_id        = each.value.server_id
  start_ip_address = each.value.start_ip_address
}
