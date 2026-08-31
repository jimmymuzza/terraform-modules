resource "azurerm_playwright_workspace" "playwright_workspaces" {
  for_each = var.playwright_workspaces

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
