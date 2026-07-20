resource "aws_vpn_concentrator" "vpn_concentrators" {
  for_each = var.vpn_concentrators

  transit_gateway_id = each.value.transit_gateway_id
  type               = each.value.type
  region             = each.value.region
  tags               = each.value.tags
}
