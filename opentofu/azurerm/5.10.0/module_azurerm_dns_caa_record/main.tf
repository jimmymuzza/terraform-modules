resource "azurerm_dns_caa_record" "dns_caa_records" {
  for_each = var.dns_caa_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record != null ? each.value.record : []
    content {
      flags = record.value.flags
      tag   = record.value.tag
      value = record.value.value
    }
  }
}
