resource "azurerm_synapse_integration_runtime_self_hosted" "synapse_integration_runtime_self_hosteds" {
  for_each = var.synapse_integration_runtime_self_hosteds

  name                 = each.value.name
  synapse_workspace_id = each.value.synapse_workspace_id
  description          = each.value.description
}
