resource "aws_ec2_local_gateway_route_table_vpc_association" "ec2_local_gateway_route_table_vpc_associations" {
  for_each = var.ec2_local_gateway_route_table_vpc_associations

  local_gateway_route_table_id = each.value.local_gateway_route_table_id
  vpc_id                       = each.value.vpc_id
  region                       = each.value.region
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
}
