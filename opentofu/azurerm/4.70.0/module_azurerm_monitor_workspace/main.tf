resource "azurerm_monitor_workspace" "monitor_workspaces" {
  for_each = var.monitor_workspaces

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
}
