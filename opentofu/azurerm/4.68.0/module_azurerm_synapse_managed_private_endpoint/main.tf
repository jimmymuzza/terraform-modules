resource "azurerm_synapse_managed_private_endpoint" "synapse_managed_private_endpoints" {
  for_each = var.synapse_managed_private_endpoints

  name                 = each.value.name
  subresource_name     = each.value.subresource_name
  synapse_workspace_id = each.value.synapse_workspace_id
  target_resource_id   = each.value.target_resource_id
}
