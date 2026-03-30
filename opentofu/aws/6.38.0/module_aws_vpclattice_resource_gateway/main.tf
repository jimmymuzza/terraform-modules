resource "aws_vpclattice_resource_gateway" "vpclattice_resource_gateways" {
  for_each = var.vpclattice_resource_gateways

  name                   = each.value.name
  subnet_ids             = each.value.subnet_ids
  vpc_id                 = each.value.vpc_id
  ip_address_type        = each.value.ip_address_type
  ipv4_addresses_per_eni = each.value.ipv4_addresses_per_eni
  region                 = each.value.region
  security_group_ids     = each.value.security_group_ids
  tags                   = each.value.tags
}
