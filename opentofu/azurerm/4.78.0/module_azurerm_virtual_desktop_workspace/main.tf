resource "azurerm_virtual_desktop_workspace" "virtual_desktop_workspaces" {
  for_each = var.virtual_desktop_workspaces

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  description                   = each.value.description
  friendly_name                 = each.value.friendly_name
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
}
