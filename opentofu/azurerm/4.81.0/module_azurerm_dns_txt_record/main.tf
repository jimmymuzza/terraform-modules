resource "azurerm_dns_txt_record" "dns_txt_records" {
  for_each = var.dns_txt_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record != null ? each.value.record : []
    content {
      value = record.value.value
    }
  }
}
