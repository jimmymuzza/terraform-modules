resource "azurerm_dns_mx_record" "dns_mx_records" {
  for_each = var.dns_mx_records

  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  name                = each.value.name
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record != null ? each.value.record : []
    content {
      exchange   = record.value.exchange
      preference = record.value.preference
    }
  }
}
