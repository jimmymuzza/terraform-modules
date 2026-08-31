resource "aws_dx_private_virtual_interface" "dx_private_virtual_interfaces" {
  for_each = var.dx_private_virtual_interfaces

  address_family   = each.value.address_family
  connection_id    = each.value.connection_id
  name             = each.value.name
  vlan             = each.value.vlan
  amazon_address   = each.value.amazon_address
  bgp_asn          = each.value.bgp_asn
  bgp_asn_long     = each.value.bgp_asn_long
  bgp_auth_key     = each.value.bgp_auth_key
  customer_address = each.value.customer_address
  dx_gateway_id    = each.value.dx_gateway_id
  mtu              = each.value.mtu
  region           = each.value.region
  sitelink_enabled = each.value.sitelink_enabled
  tags             = each.value.tags
  tags_all         = each.value.tags_all
  vpn_gateway_id   = each.value.vpn_gateway_id
}
