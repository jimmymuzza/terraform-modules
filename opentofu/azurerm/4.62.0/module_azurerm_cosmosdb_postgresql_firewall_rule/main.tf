resource "azurerm_cosmosdb_postgresql_firewall_rule" "cosmosdb_postgresql_firewall_rules" {
  for_each = var.cosmosdb_postgresql_firewall_rules

  cluster_id       = each.value.cluster_id
  end_ip_address   = each.value.end_ip_address
  name             = each.value.name
  start_ip_address = each.value.start_ip_address
}
