resource "aws_default_vpc" "default_vpcs" {
  for_each = var.default_vpcs

  assign_generated_ipv6_cidr_block     = each.value.assign_generated_ipv6_cidr_block
  enable_dns_hostnames                 = each.value.enable_dns_hostnames
  enable_dns_support                   = each.value.enable_dns_support
  enable_network_address_usage_metrics = each.value.enable_network_address_usage_metrics
  force_destroy                        = each.value.force_destroy
  ipv6_cidr_block                      = each.value.ipv6_cidr_block
  ipv6_cidr_block_network_border_group = each.value.ipv6_cidr_block_network_border_group
  ipv6_ipam_pool_id                    = each.value.ipv6_ipam_pool_id
  ipv6_netmask_length                  = each.value.ipv6_netmask_length
  region                               = each.value.region
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
}
