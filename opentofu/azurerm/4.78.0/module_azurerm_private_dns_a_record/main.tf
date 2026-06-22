resource "azurerm_private_dns_a_record" "private_dns_a_records" {
  for_each = var.private_dns_a_records

  name                = each.value.name
  records             = each.value.records
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags
}
