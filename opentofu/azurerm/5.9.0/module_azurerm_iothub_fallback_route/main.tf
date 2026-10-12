resource "azurerm_iothub_fallback_route" "iothub_fallback_routes" {
  for_each = var.iothub_fallback_routes

  enabled             = each.value.enabled
  endpoint_names      = each.value.endpoint_names
  iothub_name         = each.value.iothub_name
  resource_group_name = each.value.resource_group_name
  condition           = each.value.condition
  source              = each.value.source
}
