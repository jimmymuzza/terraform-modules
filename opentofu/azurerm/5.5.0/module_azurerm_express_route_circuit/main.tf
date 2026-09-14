resource "azurerm_express_route_circuit" "express_route_circuits" {
  for_each = var.express_route_circuits

  location                 = each.value.location
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  allow_classic_operations = each.value.allow_classic_operations
  authorization_key        = each.value.authorization_key
  bandwidth_in_gbps        = each.value.bandwidth_in_gbps
  bandwidth_in_mbps        = each.value.bandwidth_in_mbps
  express_route_port_id    = each.value.express_route_port_id
  peering_location         = each.value.peering_location
  rate_limiting_enabled    = each.value.rate_limiting_enabled
  service_provider_name    = each.value.service_provider_name
  tags                     = each.value.tags

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      family = sku.value.family
      tier   = sku.value.tier
    }
  }
}
