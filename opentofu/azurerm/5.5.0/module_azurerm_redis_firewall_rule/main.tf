resource "azurerm_redis_firewall_rule" "redis_firewall_rules" {
  for_each = var.redis_firewall_rules

  end_ip              = each.value.end_ip
  name                = each.value.name
  redis_cache_name    = each.value.redis_cache_name
  resource_group_name = each.value.resource_group_name
  start_ip            = each.value.start_ip
}
