resource "aws_ec2_local_gateway_route_table" "ec2_local_gateway_route_tables" {
  for_each = var.ec2_local_gateway_route_tables

  local_gateway_id = each.value.local_gateway_id
  mode             = each.value.mode
  region           = each.value.region
  tags             = each.value.tags
}
