resource "aws_vpc_dhcp_options_association" "vpc_dhcp_options_associations" {
  for_each = var.vpc_dhcp_options_associations

  dhcp_options_id = each.value.dhcp_options_id
  vpc_id          = each.value.vpc_id
  region          = each.value.region
}
