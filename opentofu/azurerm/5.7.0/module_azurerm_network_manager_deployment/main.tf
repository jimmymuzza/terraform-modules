resource "azurerm_network_manager_deployment" "network_manager_deployments" {
  for_each = var.network_manager_deployments

  configuration_ids  = each.value.configuration_ids
  location           = each.value.location
  network_manager_id = each.value.network_manager_id
  scope_access       = each.value.scope_access
  triggers           = each.value.triggers
}
