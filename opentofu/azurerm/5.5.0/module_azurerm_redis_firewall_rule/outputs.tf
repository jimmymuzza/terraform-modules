output "redis_firewall_rules" {
  description = "All redis_firewall_rule resources"
  value       = azurerm_redis_firewall_rule.redis_firewall_rules
}
