resource "azurerm_traffic_manager_azure_endpoint" "traffic_manager_azure_endpoints" {
  for_each = var.traffic_manager_azure_endpoints

  name                 = each.value.name
  profile_id           = each.value.profile_id
  target_resource_id   = each.value.target_resource_id
  always_serve_enabled = each.value.always_serve_enabled
  enabled              = each.value.enabled
  geo_mappings         = each.value.geo_mappings
  priority             = each.value.priority
  weight               = each.value.weight

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
