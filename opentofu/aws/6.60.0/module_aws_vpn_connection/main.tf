resource "aws_vpn_connection" "vpn_connections" {
  for_each = var.vpn_connections

  customer_gateway_id                     = each.value.customer_gateway_id
  type                                    = each.value.type
  enable_acceleration                     = each.value.enable_acceleration
  local_ipv4_network_cidr                 = each.value.local_ipv4_network_cidr
  local_ipv6_network_cidr                 = each.value.local_ipv6_network_cidr
  outside_ip_address_type                 = each.value.outside_ip_address_type
  preshared_key_storage                   = each.value.preshared_key_storage
  region                                  = each.value.region
  remote_ipv4_network_cidr                = each.value.remote_ipv4_network_cidr
  remote_ipv6_network_cidr                = each.value.remote_ipv6_network_cidr
  static_routes_only                      = each.value.static_routes_only
  tags                                    = each.value.tags
  tags_all                                = each.value.tags_all
  transit_gateway_id                      = each.value.transit_gateway_id
  transport_transit_gateway_attachment_id = each.value.transport_transit_gateway_attachment_id
  tunnel1_dpd_timeout_action              = each.value.tunnel1_dpd_timeout_action
  tunnel1_dpd_timeout_seconds             = each.value.tunnel1_dpd_timeout_seconds
  tunnel1_enable_tunnel_lifecycle_control = each.value.tunnel1_enable_tunnel_lifecycle_control
  tunnel1_ike_versions                    = each.value.tunnel1_ike_versions
  tunnel1_inside_cidr                     = each.value.tunnel1_inside_cidr
  tunnel1_inside_ipv6_cidr                = each.value.tunnel1_inside_ipv6_cidr
  tunnel1_phase1_dh_group_numbers         = each.value.tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms    = each.value.tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms     = each.value.tunnel1_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds         = each.value.tunnel1_phase1_lifetime_seconds
  tunnel1_phase2_dh_group_numbers         = each.value.tunnel1_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms    = each.value.tunnel1_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms     = each.value.tunnel1_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds         = each.value.tunnel1_phase2_lifetime_seconds
  tunnel1_preshared_key                   = each.value.tunnel1_preshared_key
  tunnel1_rekey_fuzz_percentage           = each.value.tunnel1_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds       = each.value.tunnel1_rekey_margin_time_seconds
  tunnel1_replay_window_size              = each.value.tunnel1_replay_window_size
  tunnel1_startup_action                  = each.value.tunnel1_startup_action
  tunnel2_dpd_timeout_action              = each.value.tunnel2_dpd_timeout_action
  tunnel2_dpd_timeout_seconds             = each.value.tunnel2_dpd_timeout_seconds
  tunnel2_enable_tunnel_lifecycle_control = each.value.tunnel2_enable_tunnel_lifecycle_control
  tunnel2_ike_versions                    = each.value.tunnel2_ike_versions
  tunnel2_inside_cidr                     = each.value.tunnel2_inside_cidr
  tunnel2_inside_ipv6_cidr                = each.value.tunnel2_inside_ipv6_cidr
  tunnel2_phase1_dh_group_numbers         = each.value.tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms    = each.value.tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms     = each.value.tunnel2_phase1_integrity_algorithms
  tunnel2_phase1_lifetime_seconds         = each.value.tunnel2_phase1_lifetime_seconds
  tunnel2_phase2_dh_group_numbers         = each.value.tunnel2_phase2_dh_group_numbers
  tunnel2_phase2_encryption_algorithms    = each.value.tunnel2_phase2_encryption_algorithms
  tunnel2_phase2_integrity_algorithms     = each.value.tunnel2_phase2_integrity_algorithms
  tunnel2_phase2_lifetime_seconds         = each.value.tunnel2_phase2_lifetime_seconds
  tunnel2_preshared_key                   = each.value.tunnel2_preshared_key
  tunnel2_rekey_fuzz_percentage           = each.value.tunnel2_rekey_fuzz_percentage
  tunnel2_rekey_margin_time_seconds       = each.value.tunnel2_rekey_margin_time_seconds
  tunnel2_replay_window_size              = each.value.tunnel2_replay_window_size
  tunnel2_startup_action                  = each.value.tunnel2_startup_action
  tunnel_bandwidth                        = each.value.tunnel_bandwidth
  tunnel_inside_ip_version                = each.value.tunnel_inside_ip_version
  vpn_concentrator_id                     = each.value.vpn_concentrator_id
  vpn_gateway_id                          = each.value.vpn_gateway_id

  dynamic "tunnel1_log_options" {
    for_each = each.value.tunnel1_log_options != null ? each.value.tunnel1_log_options : []
    content {

      dynamic "cloudwatch_log_options" {
        for_each = tunnel1_log_options.value.cloudwatch_log_options != null ? tunnel1_log_options.value.cloudwatch_log_options : []
        content {
          bgp_log_enabled       = cloudwatch_log_options.value.bgp_log_enabled
          bgp_log_group_arn     = cloudwatch_log_options.value.bgp_log_group_arn
          bgp_log_output_format = cloudwatch_log_options.value.bgp_log_output_format
          log_enabled           = cloudwatch_log_options.value.log_enabled
          log_group_arn         = cloudwatch_log_options.value.log_group_arn
          log_output_format     = cloudwatch_log_options.value.log_output_format
        }
      }
    }
  }

  dynamic "tunnel2_log_options" {
    for_each = each.value.tunnel2_log_options != null ? each.value.tunnel2_log_options : []
    content {

      dynamic "cloudwatch_log_options" {
        for_each = tunnel2_log_options.value.cloudwatch_log_options != null ? tunnel2_log_options.value.cloudwatch_log_options : []
        content {
          bgp_log_enabled       = cloudwatch_log_options.value.bgp_log_enabled
          bgp_log_group_arn     = cloudwatch_log_options.value.bgp_log_group_arn
          bgp_log_output_format = cloudwatch_log_options.value.bgp_log_output_format
          log_enabled           = cloudwatch_log_options.value.log_enabled
          log_group_arn         = cloudwatch_log_options.value.log_group_arn
          log_output_format     = cloudwatch_log_options.value.log_output_format
        }
      }
    }
  }
}
