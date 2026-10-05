output "mongo_cluster_firewall_rules" {
  description = "All mongo_cluster_firewall_rule resources"
  value       = azurerm_mongo_cluster_firewall_rule.mongo_cluster_firewall_rules
}
