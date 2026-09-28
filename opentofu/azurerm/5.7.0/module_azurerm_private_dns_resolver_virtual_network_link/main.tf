resource "azurerm_private_dns_resolver_virtual_network_link" "private_dns_resolver_virtual_network_links" {
  for_each = var.private_dns_resolver_virtual_network_links

  dns_forwarding_ruleset_id = each.value.dns_forwarding_ruleset_id
  name                      = each.value.name
  virtual_network_id        = each.value.virtual_network_id
  metadata                  = each.value.metadata
}
