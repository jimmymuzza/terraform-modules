output "nat_gateway_public_ip_associations" {
  description = "All nat_gateway_public_ip_association resources"
  value       = azurerm_nat_gateway_public_ip_association.nat_gateway_public_ip_associations
}
