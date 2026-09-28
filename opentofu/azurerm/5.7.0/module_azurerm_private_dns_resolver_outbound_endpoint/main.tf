resource "azurerm_private_dns_resolver_outbound_endpoint" "private_dns_resolver_outbound_endpoints" {
  for_each = var.private_dns_resolver_outbound_endpoints

  location                = each.value.location
  name                    = each.value.name
  private_dns_resolver_id = each.value.private_dns_resolver_id
  subnet_id               = each.value.subnet_id
  tags                    = each.value.tags
}
