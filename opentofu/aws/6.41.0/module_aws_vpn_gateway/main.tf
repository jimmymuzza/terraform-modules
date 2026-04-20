resource "aws_vpn_gateway" "vpn_gateways" {
  for_each = var.vpn_gateways

  amazon_side_asn   = each.value.amazon_side_asn
  availability_zone = each.value.availability_zone
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  vpc_id            = each.value.vpc_id
}
