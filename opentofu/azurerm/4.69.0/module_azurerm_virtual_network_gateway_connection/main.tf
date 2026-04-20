resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connections" {
  for_each = var.virtual_network_gateway_connections

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  type                               = each.value.type
  virtual_network_gateway_id         = each.value.virtual_network_gateway_id
  authorization_key                  = each.value.authorization_key
  bgp_enabled                        = each.value.bgp_enabled
  connection_mode                    = each.value.connection_mode
  connection_protocol                = each.value.connection_protocol
  dpd_timeout_seconds                = each.value.dpd_timeout_seconds
  egress_nat_rule_ids                = each.value.egress_nat_rule_ids
  enable_bgp                         = each.value.enable_bgp
  express_route_circuit_id           = each.value.express_route_circuit_id
  express_route_gateway_bypass       = each.value.express_route_gateway_bypass
  ingress_nat_rule_ids               = each.value.ingress_nat_rule_ids
  local_azure_ip_address_enabled     = each.value.local_azure_ip_address_enabled
  local_network_gateway_id           = each.value.local_network_gateway_id
  peer_virtual_network_gateway_id    = each.value.peer_virtual_network_gateway_id
  private_link_fast_path_enabled     = each.value.private_link_fast_path_enabled
  routing_weight                     = each.value.routing_weight
  shared_key                         = each.value.shared_key
  tags                               = each.value.tags
  use_policy_based_traffic_selectors = each.value.use_policy_based_traffic_selectors

  dynamic "custom_bgp_addresses" {
    for_each = each.value.custom_bgp_addresses != null ? each.value.custom_bgp_addresses : []
    content {
      primary   = custom_bgp_addresses.value.primary
      secondary = custom_bgp_addresses.value.secondary
    }
  }

  dynamic "ipsec_policy" {
    for_each = each.value.ipsec_policy != null ? each.value.ipsec_policy : []
    content {
      dh_group         = ipsec_policy.value.dh_group
      ike_encryption   = ipsec_policy.value.ike_encryption
      ike_integrity    = ipsec_policy.value.ike_integrity
      ipsec_encryption = ipsec_policy.value.ipsec_encryption
      ipsec_integrity  = ipsec_policy.value.ipsec_integrity
      pfs_group        = ipsec_policy.value.pfs_group
      sa_datasize      = ipsec_policy.value.sa_datasize
      sa_lifetime      = ipsec_policy.value.sa_lifetime
    }
  }

  dynamic "traffic_selector_policy" {
    for_each = each.value.traffic_selector_policy != null ? each.value.traffic_selector_policy : []
    content {
      local_address_cidrs  = traffic_selector_policy.value.local_address_cidrs
      remote_address_cidrs = traffic_selector_policy.value.remote_address_cidrs
    }
  }
}
