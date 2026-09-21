resource "azurerm_dns_ns_record" "dns_ns_records" {
  for_each = var.dns_ns_records

  name                = each.value.name
  records             = each.value.records
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags
}
