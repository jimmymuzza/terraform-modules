resource "azurerm_private_dns_resolver_forwarding_rule" "private_dns_resolver_forwarding_rules" {
  for_each = var.private_dns_resolver_forwarding_rules

  dns_forwarding_ruleset_id = each.value.dns_forwarding_ruleset_id
  domain_name               = each.value.domain_name
  name                      = each.value.name
  enabled                   = each.value.enabled
  metadata                  = each.value.metadata

  dynamic "target_dns_servers" {
    for_each = each.value.target_dns_servers != null ? each.value.target_dns_servers : []
    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }
}
