resource "azurerm_security_center_workspace" "security_center_workspaces" {
  for_each = var.security_center_workspaces

  scope        = each.value.scope
  workspace_id = each.value.workspace_id
}
