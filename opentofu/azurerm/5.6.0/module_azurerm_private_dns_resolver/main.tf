resource "azurerm_private_dns_resolver" "private_dns_resolvers" {
  for_each = var.private_dns_resolvers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_id  = each.value.virtual_network_id
  tags                = each.value.tags
}
