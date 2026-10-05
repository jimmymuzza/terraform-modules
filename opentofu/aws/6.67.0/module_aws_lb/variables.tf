variable "lbs" {
  description = <<EOT
Map of lbs, attributes below
Optional:
    - client_keep_alive
    - customer_owned_ipv4_pool
    - desync_mitigation_mode
    - dns_record_client_routing_policy
    - drop_invalid_header_fields
    - enable_cross_zone_load_balancing
    - enable_deletion_protection
    - enable_http2
    - enable_prefix_for_ipv6_source_nat
    - enable_tls_version_and_cipher_suite_headers
    - enable_waf_fail_open
    - enable_xff_client_port
    - enable_zonal_shift
    - enforce_security_group_inbound_rules_on_private_link_traffic
    - idle_timeout
    - internal
    - ip_address_type
    - load_balancer_type
    - name
    - name_prefix
    - preserve_host_header
    - region
    - secondary_ips_auto_assigned_per_subnet
    - security_groups
    - subnets
    - tags
    - tags_all
    - xff_header_processing_mode
    - access_logs
    - connection_logs
    - health_check_logs
    - ipam_pools
    - minimum_load_balancer_capacity
    - subnet_mapping
EOT

  type = map(object({
    client_keep_alive                                            = optional(number)
    customer_owned_ipv4_pool                                     = optional(string)
    desync_mitigation_mode                                       = optional(string)
    dns_record_client_routing_policy                             = optional(string)
    drop_invalid_header_fields                                   = optional(bool)
    enable_cross_zone_load_balancing                             = optional(bool)
    enable_deletion_protection                                   = optional(bool)
    enable_http2                                                 = optional(bool)
    enable_prefix_for_ipv6_source_nat                            = optional(string)
    enable_tls_version_and_cipher_suite_headers                  = optional(bool)
    enable_waf_fail_open                                         = optional(bool)
    enable_xff_client_port                                       = optional(bool)
    enable_zonal_shift                                           = optional(bool)
    enforce_security_group_inbound_rules_on_private_link_traffic = optional(string)
    idle_timeout                                                 = optional(number)
    internal                                                     = optional(bool)
    ip_address_type                                              = optional(string)
    load_balancer_type                                           = optional(string)
    name                                                         = optional(string)
    name_prefix                                                  = optional(string)
    preserve_host_header                                         = optional(bool)
    region                                                       = optional(string)
    secondary_ips_auto_assigned_per_subnet                       = optional(number)
    security_groups                                              = optional(set(string))
    subnets                                                      = optional(set(string))
    tags                                                         = optional(map(string))
    tags_all                                                     = optional(map(string))
    xff_header_processing_mode                                   = optional(string)
    access_logs                                                  = optional(list(object({
            bucket  = string
            enabled = optional(bool)
            prefix  = optional(string)
        })))
    connection_logs                                              = optional(list(object({
            bucket  = string
            enabled = optional(bool)
            prefix  = optional(string)
        })))
    health_check_logs                                            = optional(list(object({
            bucket  = string
            enabled = optional(bool)
            prefix  = optional(string)
        })))
    ipam_pools                                                   = optional(list(object({
            ipv4_ipam_pool_id = string
        })))
    minimum_load_balancer_capacity                               = optional(list(object({
            capacity_units = number
        })))
    subnet_mapping                                               = optional(set(object({
            subnet_id            = string
            allocation_id        = optional(string)
            ipv6_address         = optional(string)
            private_ipv4_address = optional(string)
        })))
  }))
}
