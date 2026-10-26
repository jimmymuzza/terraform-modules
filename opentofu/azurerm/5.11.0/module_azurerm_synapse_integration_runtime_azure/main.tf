resource "azurerm_synapse_integration_runtime_azure" "synapse_integration_runtime_azures" {
  for_each = var.synapse_integration_runtime_azures

  location             = each.value.location
  name                 = each.value.name
  synapse_workspace_id = each.value.synapse_workspace_id
  compute_type         = each.value.compute_type
  core_count           = each.value.core_count
  description          = each.value.description
  time_to_live_min     = each.value.time_to_live_min
}
