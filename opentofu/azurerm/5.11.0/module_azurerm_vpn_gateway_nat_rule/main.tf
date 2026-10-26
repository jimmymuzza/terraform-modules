resource "azurerm_vpn_gateway_nat_rule" "vpn_gateway_nat_rules" {
  for_each = var.vpn_gateway_nat_rules

  name                = each.value.name
  vpn_gateway_id      = each.value.vpn_gateway_id
  ip_configuration_id = each.value.ip_configuration_id
  mode                = each.value.mode
  type                = each.value.type

  dynamic "external_mapping" {
    for_each = each.value.external_mapping != null ? each.value.external_mapping : []
    content {
      address_space = external_mapping.value.address_space
      port_range    = external_mapping.value.port_range
    }
  }

  dynamic "internal_mapping" {
    for_each = each.value.internal_mapping != null ? each.value.internal_mapping : []
    content {
      address_space = internal_mapping.value.address_space
      port_range    = internal_mapping.value.port_range
    }
  }
}
