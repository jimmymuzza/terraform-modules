resource "aws_vpc_endpoint_route_table_association" "vpc_endpoint_route_table_associations" {
  for_each = var.vpc_endpoint_route_table_associations

  route_table_id  = each.value.route_table_id
  vpc_endpoint_id = each.value.vpc_endpoint_id
  region          = each.value.region
}
