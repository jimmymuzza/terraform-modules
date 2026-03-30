resource "aws_vpc_security_group_vpc_association" "vpc_security_group_vpc_associations" {
  for_each = var.vpc_security_group_vpc_associations

  security_group_id = each.value.security_group_id
  vpc_id            = each.value.vpc_id
  region            = each.value.region
}
