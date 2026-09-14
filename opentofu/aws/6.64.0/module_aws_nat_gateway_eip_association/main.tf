resource "aws_nat_gateway_eip_association" "nat_gateway_eip_associations" {
  for_each = var.nat_gateway_eip_associations

  allocation_id  = each.value.allocation_id
  nat_gateway_id = each.value.nat_gateway_id
  region         = each.value.region
}
