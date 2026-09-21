resource "azurerm_traffic_manager_profile" "traffic_manager_profiles" {
  for_each = var.traffic_manager_profiles

  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  traffic_routing_method = each.value.traffic_routing_method
  max_return             = each.value.max_return
  profile_status         = each.value.profile_status
  tags                   = each.value.tags
  traffic_view_enabled   = each.value.traffic_view_enabled

  dynamic "dns_config" {
    for_each = each.value.dns_config != null ? each.value.dns_config : []
    content {
      relative_name = dns_config.value.relative_name
      ttl           = dns_config.value.ttl
    }
  }

  dynamic "monitor_config" {
    for_each = each.value.monitor_config != null ? each.value.monitor_config : []
    content {
      port                         = monitor_config.value.port
      protocol                     = monitor_config.value.protocol
      expected_status_code_ranges  = monitor_config.value.expected_status_code_ranges
      interval_in_seconds          = monitor_config.value.interval_in_seconds
      path                         = monitor_config.value.path
      timeout_in_seconds           = monitor_config.value.timeout_in_seconds
      tolerated_number_of_failures = monitor_config.value.tolerated_number_of_failures

      dynamic "custom_header" {
        for_each = monitor_config.value.custom_header != null ? monitor_config.value.custom_header : []
        content {
          name  = custom_header.value.name
          value = custom_header.value.value
        }
      }
    }
  }
}
