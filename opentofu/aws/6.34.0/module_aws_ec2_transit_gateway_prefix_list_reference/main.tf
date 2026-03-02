resource "aws_ec2_transit_gateway_prefix_list_reference" "ec2_transit_gateway_prefix_list_references" {
  for_each = var.ec2_transit_gateway_prefix_list_references

  prefix_list_id                 = each.value.prefix_list_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  blackhole                      = each.value.blackhole
  region                         = each.value.region
  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
}
