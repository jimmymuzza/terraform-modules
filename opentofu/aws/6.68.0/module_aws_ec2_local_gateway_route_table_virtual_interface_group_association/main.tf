resource "aws_ec2_local_gateway_route_table_virtual_interface_group_association" "ec2_local_gateway_route_table_virtual_interface_group_associations" {
  for_each = var.ec2_local_gateway_route_table_virtual_interface_group_associations

  local_gateway_route_table_id             = each.value.local_gateway_route_table_id
  local_gateway_virtual_interface_group_id = each.value.local_gateway_virtual_interface_group_id
  region                                   = each.value.region
  tags                                     = each.value.tags
}
