resource "azurerm_api_management_workspace" "api_management_workspaces" {
  for_each = var.api_management_workspaces

  api_management_id = each.value.api_management_id
  display_name      = each.value.display_name
  name              = each.value.name
  description       = each.value.description
}
