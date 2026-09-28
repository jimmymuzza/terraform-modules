resource "aws_vpc_ipv4_cidr_block_association" "vpc_ipv4_cidr_block_associations" {
  for_each = var.vpc_ipv4_cidr_block_associations

  vpc_id              = each.value.vpc_id
  cidr_block          = each.value.cidr_block
  ipv4_ipam_pool_id   = each.value.ipv4_ipam_pool_id
  ipv4_netmask_length = each.value.ipv4_netmask_length
  region              = each.value.region
}
