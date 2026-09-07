resource "aws_dx_hosted_public_virtual_interface" "dx_hosted_public_virtual_interfaces" {
  for_each = var.dx_hosted_public_virtual_interfaces

  address_family        = each.value.address_family
  bgp_asn               = each.value.bgp_asn
  connection_id         = each.value.connection_id
  name                  = each.value.name
  owner_account_id      = each.value.owner_account_id
  route_filter_prefixes = each.value.route_filter_prefixes
  vlan                  = each.value.vlan
  amazon_address        = each.value.amazon_address
  bgp_auth_key          = each.value.bgp_auth_key
  customer_address      = each.value.customer_address
  rate_limit            = each.value.rate_limit
  region                = each.value.region
}
