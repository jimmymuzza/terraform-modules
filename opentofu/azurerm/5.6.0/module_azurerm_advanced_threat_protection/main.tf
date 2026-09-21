resource "azurerm_advanced_threat_protection" "advanced_threat_protections" {
  for_each = var.advanced_threat_protections

  enabled            = each.value.enabled
  target_resource_id = each.value.target_resource_id
}
