resource "azurerm_network_security_group" "network_security_groups" {
  for_each = var.network_security_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  security_rule       = each.value.security_rule
  tags                = each.value.tags
}
