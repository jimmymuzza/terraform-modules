output "postgresql_firewall_rules" {
  description = "All postgresql_firewall_rule resources"
  value       = azurerm_postgresql_firewall_rule.postgresql_firewall_rules
}
