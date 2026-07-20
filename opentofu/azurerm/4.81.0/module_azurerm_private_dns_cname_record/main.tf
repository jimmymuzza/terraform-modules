resource "azurerm_private_dns_cname_record" "private_dns_cname_records" {
  for_each = var.private_dns_cname_records

  name                = each.value.name
  record              = each.value.record
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags
}
