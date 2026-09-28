resource "aws_s3outposts_endpoint" "s3outposts_endpoints" {
  for_each = var.s3outposts_endpoints

  outpost_id               = each.value.outpost_id
  security_group_id        = each.value.security_group_id
  subnet_id                = each.value.subnet_id
  access_type              = each.value.access_type
  customer_owned_ipv4_pool = each.value.customer_owned_ipv4_pool
  region                   = each.value.region
}
