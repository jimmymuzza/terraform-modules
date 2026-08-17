resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_links" {
  for_each = var.private_dns_zone_virtual_network_links

  name                 = each.value.name
  private_dns_zone_id  = each.value.private_dns_zone_id
  virtual_network_id   = each.value.virtual_network_id
  registration_enabled = each.value.registration_enabled
  resolution_policy    = each.value.resolution_policy
  tags                 = each.value.tags
}
