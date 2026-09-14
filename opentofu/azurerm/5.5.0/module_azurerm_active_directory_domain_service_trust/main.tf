resource "azurerm_active_directory_domain_service_trust" "active_directory_domain_service_trusts" {
  for_each = var.active_directory_domain_service_trusts

  domain_service_id      = each.value.domain_service_id
  name                   = each.value.name
  password               = each.value.password
  trusted_domain_dns_ips = each.value.trusted_domain_dns_ips
  trusted_domain_fqdn    = each.value.trusted_domain_fqdn
}
