resource "azurerm_dns_zone" "dns_zones" {
  for_each = var.dns_zones

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "soa_record" {
    for_each = each.value.soa_record != null ? each.value.soa_record : []
    content {
      email         = soa_record.value.email
      expire_time   = soa_record.value.expire_time
      minimum_ttl   = soa_record.value.minimum_ttl
      refresh_time  = soa_record.value.refresh_time
      retry_time    = soa_record.value.retry_time
      serial_number = soa_record.value.serial_number
      tags          = soa_record.value.tags
      ttl           = soa_record.value.ttl
    }
  }
}
