resource "azurerm_network_manager_verifier_workspace" "network_manager_verifier_workspaces" {
  for_each = var.network_manager_verifier_workspaces

  location           = each.value.location
  name               = each.value.name
  network_manager_id = each.value.network_manager_id
  description        = each.value.description
  tags               = each.value.tags
}
