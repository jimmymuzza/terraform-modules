resource "azurerm_network_manager_security_admin_configuration" "network_manager_security_admin_configurations" {
  for_each = var.network_manager_security_admin_configurations

  name                                          = each.value.name
  network_manager_id                            = each.value.network_manager_id
  apply_on_network_intent_policy_based_services = each.value.apply_on_network_intent_policy_based_services
  description                                   = each.value.description
}
