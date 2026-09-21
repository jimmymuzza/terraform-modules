resource "azurerm_resource_management_private_link_association" "resource_management_private_link_associations" {
  for_each = var.resource_management_private_link_associations

  management_group_id                 = each.value.management_group_id
  public_network_access_enabled       = each.value.public_network_access_enabled
  resource_management_private_link_id = each.value.resource_management_private_link_id
  name                                = each.value.name
}
