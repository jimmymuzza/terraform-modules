resource "azurerm_dns_cname_record" "dns_cname_records" {
  for_each = var.dns_cname_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  record              = each.value.record
  tags                = each.value.tags
  target_resource_id  = each.value.target_resource_id
}
