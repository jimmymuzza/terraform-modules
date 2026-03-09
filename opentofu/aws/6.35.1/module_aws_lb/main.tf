resource "aws_lb" "lbs" {
  for_each = var.lbs

  client_keep_alive                                            = each.value.client_keep_alive
  customer_owned_ipv4_pool                                     = each.value.customer_owned_ipv4_pool
  desync_mitigation_mode                                       = each.value.desync_mitigation_mode
  dns_record_client_routing_policy                             = each.value.dns_record_client_routing_policy
  drop_invalid_header_fields                                   = each.value.drop_invalid_header_fields
  enable_cross_zone_load_balancing                             = each.value.enable_cross_zone_load_balancing
  enable_deletion_protection                                   = each.value.enable_deletion_protection
  enable_http2                                                 = each.value.enable_http2
  enable_tls_version_and_cipher_suite_headers                  = each.value.enable_tls_version_and_cipher_suite_headers
  enable_waf_fail_open                                         = each.value.enable_waf_fail_open
  enable_xff_client_port                                       = each.value.enable_xff_client_port
  enable_zonal_shift                                           = each.value.enable_zonal_shift
  enforce_security_group_inbound_rules_on_private_link_traffic = each.value.enforce_security_group_inbound_rules_on_private_link_traffic
  idle_timeout                                                 = each.value.idle_timeout
  internal                                                     = each.value.internal
  ip_address_type                                              = each.value.ip_address_type
  load_balancer_type                                           = each.value.load_balancer_type
  name                                                         = each.value.name
  name_prefix                                                  = each.value.name_prefix
  preserve_host_header                                         = each.value.preserve_host_header
  region                                                       = each.value.region
  secondary_ips_auto_assigned_per_subnet                       = each.value.secondary_ips_auto_assigned_per_subnet
  security_groups                                              = each.value.security_groups
  subnets                                                      = each.value.subnets
  tags                                                         = each.value.tags
  tags_all                                                     = each.value.tags_all
  xff_header_processing_mode                                   = each.value.xff_header_processing_mode

  dynamic "access_logs" {
    for_each = each.value.access_logs != null ? each.value.access_logs : []
    content {
      bucket  = access_logs.value.bucket
      enabled = access_logs.value.enabled
      prefix  = access_logs.value.prefix
    }
  }

  dynamic "connection_logs" {
    for_each = each.value.connection_logs != null ? each.value.connection_logs : []
    content {
      bucket  = connection_logs.value.bucket
      enabled = connection_logs.value.enabled
      prefix  = connection_logs.value.prefix
    }
  }

  dynamic "health_check_logs" {
    for_each = each.value.health_check_logs != null ? each.value.health_check_logs : []
    content {
      bucket  = health_check_logs.value.bucket
      enabled = health_check_logs.value.enabled
      prefix  = health_check_logs.value.prefix
    }
  }

  dynamic "ipam_pools" {
    for_each = each.value.ipam_pools != null ? each.value.ipam_pools : []
    content {
      ipv4_ipam_pool_id = ipam_pools.value.ipv4_ipam_pool_id
    }
  }

  dynamic "minimum_load_balancer_capacity" {
    for_each = each.value.minimum_load_balancer_capacity != null ? each.value.minimum_load_balancer_capacity : []
    content {
      capacity_units = minimum_load_balancer_capacity.value.capacity_units
    }
  }

  dynamic "subnet_mapping" {
    for_each = each.value.subnet_mapping != null ? each.value.subnet_mapping : []
    content {
      subnet_id            = subnet_mapping.value.subnet_id
      allocation_id        = subnet_mapping.value.allocation_id
      ipv6_address         = subnet_mapping.value.ipv6_address
      private_ipv4_address = subnet_mapping.value.private_ipv4_address
    }
  }
}
