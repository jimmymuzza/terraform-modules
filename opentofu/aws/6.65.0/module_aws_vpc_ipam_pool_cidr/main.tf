resource "aws_vpc_ipam_pool_cidr" "vpc_ipam_pool_cidrs" {
  for_each = var.vpc_ipam_pool_cidrs

  ipam_pool_id   = each.value.ipam_pool_id
  cidr           = each.value.cidr
  netmask_length = each.value.netmask_length
  region         = each.value.region

  dynamic "cidr_authorization_context" {
    for_each = each.value.cidr_authorization_context != null ? each.value.cidr_authorization_context : []
    content {
      message   = cidr_authorization_context.value.message
      signature = cidr_authorization_context.value.signature
    }
  }
}
