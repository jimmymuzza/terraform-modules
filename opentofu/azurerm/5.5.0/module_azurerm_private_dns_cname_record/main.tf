resource "azurerm_private_dns_cname_record" "private_dns_cname_records" {
  for_each = var.private_dns_cname_records

  name                = each.value.name
  private_dns_zone_id = each.value.private_dns_zone_id
  record              = each.value.record
  ttl                 = each.value.ttl
  tags                = each.value.tags
}
