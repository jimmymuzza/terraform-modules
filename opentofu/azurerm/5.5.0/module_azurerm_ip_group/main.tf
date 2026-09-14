resource "azurerm_ip_group" "ip_groups" {
  for_each = var.ip_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  cidrs               = each.value.cidrs
  tags                = each.value.tags
}
