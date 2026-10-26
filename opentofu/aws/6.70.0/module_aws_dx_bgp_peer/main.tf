resource "aws_dx_bgp_peer" "dx_bgp_peers" {
  for_each = var.dx_bgp_peers

  address_family       = each.value.address_family
  virtual_interface_id = each.value.virtual_interface_id
  amazon_address       = each.value.amazon_address
  bgp_asn              = each.value.bgp_asn
  bgp_asn_long         = each.value.bgp_asn_long
  bgp_auth_key         = each.value.bgp_auth_key
  customer_address     = each.value.customer_address
  region               = each.value.region
}
