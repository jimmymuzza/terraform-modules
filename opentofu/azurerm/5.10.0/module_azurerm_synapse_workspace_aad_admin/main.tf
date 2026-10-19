resource "azurerm_synapse_workspace_aad_admin" "synapse_workspace_aad_admins" {
  for_each = var.synapse_workspace_aad_admins

  login                = each.value.login
  object_id            = each.value.object_id
  synapse_workspace_id = each.value.synapse_workspace_id
  tenant_id            = each.value.tenant_id
}
