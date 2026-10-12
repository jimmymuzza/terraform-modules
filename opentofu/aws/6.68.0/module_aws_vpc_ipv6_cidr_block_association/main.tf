resource "aws_vpc_ipv6_cidr_block_association" "vpc_ipv6_cidr_block_associations" {
  for_each = var.vpc_ipv6_cidr_block_associations

  vpc_id                           = each.value.vpc_id
  assign_generated_ipv6_cidr_block = each.value.assign_generated_ipv6_cidr_block
  ipv6_cidr_block                  = each.value.ipv6_cidr_block
  ipv6_ipam_pool_id                = each.value.ipv6_ipam_pool_id
  ipv6_netmask_length              = each.value.ipv6_netmask_length
  ipv6_pool                        = each.value.ipv6_pool
  region                           = each.value.region
}
