resource "azurerm_private_dns_ptr_record" "private_dns_ptr_records" {
  for_each = var.private_dns_ptr_records

  name                = each.value.name
  private_dns_zone_id = each.value.private_dns_zone_id
  records             = each.value.records
  ttl                 = each.value.ttl
  tags                = each.value.tags
}
