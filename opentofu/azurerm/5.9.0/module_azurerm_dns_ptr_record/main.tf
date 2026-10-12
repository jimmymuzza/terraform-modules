resource "azurerm_dns_ptr_record" "dns_ptr_records" {
  for_each = var.dns_ptr_records

  name                = each.value.name
  records             = each.value.records
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags
}
