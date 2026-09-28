resource "aws_vpn_gateway_attachment" "vpn_gateway_attachments" {
  for_each = var.vpn_gateway_attachments

  vpc_id         = each.value.vpc_id
  vpn_gateway_id = each.value.vpn_gateway_id
  region         = each.value.region
}
