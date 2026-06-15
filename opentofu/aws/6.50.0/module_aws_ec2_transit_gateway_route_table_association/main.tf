resource "aws_ec2_transit_gateway_route_table_association" "ec2_transit_gateway_route_table_associations" {
  for_each = var.ec2_transit_gateway_route_table_associations

  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  region                         = each.value.region
  replace_existing_association   = each.value.replace_existing_association
}
