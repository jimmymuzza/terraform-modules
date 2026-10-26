resource "azurerm_private_dns_txt_record" "private_dns_txt_records" {
  for_each = var.private_dns_txt_records

  name                = each.value.name
  private_dns_zone_id = each.value.private_dns_zone_id
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record != null ? each.value.record : []
    content {
      value = record.value.value
    }
  }
}
