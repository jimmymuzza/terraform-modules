resource "aws_customer_gateway" "customer_gateways" {
  for_each = var.customer_gateways

  type             = each.value.type
  bgp_asn          = each.value.bgp_asn
  bgp_asn_extended = each.value.bgp_asn_extended
  certificate_arn  = each.value.certificate_arn
  device_name      = each.value.device_name
  ip_address       = each.value.ip_address
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
