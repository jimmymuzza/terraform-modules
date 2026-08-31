resource "aws_vpc_endpoint_security_group_association" "vpc_endpoint_security_group_associations" {
  for_each = var.vpc_endpoint_security_group_associations

  security_group_id           = each.value.security_group_id
  vpc_endpoint_id             = each.value.vpc_endpoint_id
  region                      = each.value.region
  replace_default_association = each.value.replace_default_association
}
