resource "azurerm_dns_srv_record" "dns_srv_records" {
  for_each = var.dns_srv_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record != null ? each.value.record : []
    content {
      port     = record.value.port
      priority = record.value.priority
      target   = record.value.target
      weight   = record.value.weight
    }
  }
}
