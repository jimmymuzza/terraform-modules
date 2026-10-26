resource "azurerm_synapse_workspace_key" "synapse_workspace_keys" {
  for_each = var.synapse_workspace_keys

  active                              = each.value.active
  customer_managed_key_name           = each.value.customer_managed_key_name
  synapse_workspace_id                = each.value.synapse_workspace_id
  customer_managed_key_versionless_id = each.value.customer_managed_key_versionless_id
}
