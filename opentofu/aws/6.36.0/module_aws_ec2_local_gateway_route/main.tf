resource "aws_ec2_local_gateway_route" "ec2_local_gateway_routes" {
  for_each = var.ec2_local_gateway_routes

  destination_cidr_block                   = each.value.destination_cidr_block
  local_gateway_route_table_id             = each.value.local_gateway_route_table_id
  local_gateway_virtual_interface_group_id = each.value.local_gateway_virtual_interface_group_id
  region                                   = each.value.region
}
