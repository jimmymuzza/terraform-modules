resource "azurerm_mongo_cluster_firewall_rule" "mongo_cluster_firewall_rules" {
  for_each = var.mongo_cluster_firewall_rules

  end_ip_address   = each.value.end_ip_address
  mongo_cluster_id = each.value.mongo_cluster_id
  name             = each.value.name
  start_ip_address = each.value.start_ip_address
}
