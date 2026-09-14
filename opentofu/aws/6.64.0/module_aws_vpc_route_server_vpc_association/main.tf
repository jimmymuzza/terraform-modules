resource "aws_vpc_route_server_vpc_association" "vpc_route_server_vpc_associations" {
  for_each = var.vpc_route_server_vpc_associations

  route_server_id = each.value.route_server_id
  vpc_id          = each.value.vpc_id
  region          = each.value.region
}
