resource "azurerm_healthcare_workspace" "healthcare_workspaces" {
  for_each = var.healthcare_workspaces

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
