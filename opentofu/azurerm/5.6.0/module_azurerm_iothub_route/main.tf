resource "azurerm_iothub_route" "iothub_routes" {
  for_each = var.iothub_routes

  enabled             = each.value.enabled
  endpoint_names      = each.value.endpoint_names
  iothub_name         = each.value.iothub_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  source              = each.value.source
  condition           = each.value.condition
}
