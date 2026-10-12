resource "azurerm_arc_private_link_scope" "arc_private_link_scopes" {
  for_each = var.arc_private_link_scopes

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
}
