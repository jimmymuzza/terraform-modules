resource "aws_vpc_endpoint_subnet_association" "vpc_endpoint_subnet_associations" {
  for_each = var.vpc_endpoint_subnet_associations

  subnet_id       = each.value.subnet_id
  vpc_endpoint_id = each.value.vpc_endpoint_id
  region          = each.value.region
}
