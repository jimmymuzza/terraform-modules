resource "azurerm_traffic_manager_nested_endpoint" "traffic_manager_nested_endpoints" {
  for_each = var.traffic_manager_nested_endpoints

  minimum_child_endpoints               = each.value.minimum_child_endpoints
  name                                  = each.value.name
  profile_id                            = each.value.profile_id
  target_resource_id                    = each.value.target_resource_id
  enabled                               = each.value.enabled
  endpoint_location                     = each.value.endpoint_location
  geo_mappings                          = each.value.geo_mappings
  minimum_required_child_endpoints_ipv4 = each.value.minimum_required_child_endpoints_ipv4
  minimum_required_child_endpoints_ipv6 = each.value.minimum_required_child_endpoints_ipv6
  priority                              = each.value.priority
  weight                                = each.value.weight

  dynamic "custom_header" {
    for_each = each.value.custom_header != null ? each.value.custom_header : []
    content {
      name  = custom_header.value.name
      value = custom_header.value.value
    }
  }

  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      first = subnet.value.first
      last  = subnet.value.last
      scope = subnet.value.scope
    }
  }
}
