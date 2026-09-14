resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "private_dns_resolver_dns_forwarding_rulesets" {
  for_each = var.private_dns_resolver_dns_forwarding_rulesets

  location                                   = each.value.location
  name                                       = each.value.name
  private_dns_resolver_outbound_endpoint_ids = each.value.private_dns_resolver_outbound_endpoint_ids
  resource_group_name                        = each.value.resource_group_name
  tags                                       = each.value.tags
}
