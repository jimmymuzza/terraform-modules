resource "azurerm_virtual_desktop_workspace_application_group_association" "virtual_desktop_workspace_application_group_associations" {
  for_each = var.virtual_desktop_workspace_application_group_associations

  application_group_id = each.value.application_group_id
  workspace_id         = each.value.workspace_id
}
