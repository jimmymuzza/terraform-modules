resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ec2_transit_gateway_peering_attachment_accepters" {
  for_each = var.ec2_transit_gateway_peering_attachment_accepters

  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id
  region                        = each.value.region
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
}
