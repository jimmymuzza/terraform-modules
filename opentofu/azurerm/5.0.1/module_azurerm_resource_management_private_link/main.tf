resource "azurerm_resource_management_private_link" "resource_management_private_links" {
  for_each = var.resource_management_private_links

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
