resource "aws_vpc_ipam_pool_cidr_allocation" "vpc_ipam_pool_cidr_allocations" {
  for_each = var.vpc_ipam_pool_cidr_allocations

  ipam_pool_id     = each.value.ipam_pool_id
  cidr             = each.value.cidr
  description      = each.value.description
  disallowed_cidrs = each.value.disallowed_cidrs
  netmask_length   = each.value.netmask_length
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
