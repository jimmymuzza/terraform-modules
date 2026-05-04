resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id                                         = each.value.vpc_id
  assign_ipv6_address_on_creation                = each.value.assign_ipv6_address_on_creation
  availability_zone                              = each.value.availability_zone
  availability_zone_id                           = each.value.availability_zone_id
  cidr_block                                     = each.value.cidr_block
  customer_owned_ipv4_pool                       = each.value.customer_owned_ipv4_pool
  enable_dns64                                   = each.value.enable_dns64
  enable_lni_at_device_index                     = each.value.enable_lni_at_device_index
  enable_resource_name_dns_a_record_on_launch    = each.value.enable_resource_name_dns_a_record_on_launch
  enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch
  ipv4_ipam_pool_id                              = each.value.ipv4_ipam_pool_id
  ipv4_netmask_length                            = each.value.ipv4_netmask_length
  ipv6_cidr_block                                = each.value.ipv6_cidr_block
  ipv6_ipam_pool_id                              = each.value.ipv6_ipam_pool_id
  ipv6_native                                    = each.value.ipv6_native
  ipv6_netmask_length                            = each.value.ipv6_netmask_length
  map_customer_owned_ip_on_launch                = each.value.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = each.value.map_public_ip_on_launch
  outpost_arn                                    = each.value.outpost_arn
  private_dns_hostname_type_on_launch            = each.value.private_dns_hostname_type_on_launch
  region                                         = each.value.region
  tags                                           = each.value.tags
  tags_all                                       = each.value.tags_all
}
