resource "azurerm_dns_a_record" "dns_a_records" {
  for_each = var.dns_a_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  records             = each.value.records
  tags                = each.value.tags
  target_resource_id  = each.value.target_resource_id
}
