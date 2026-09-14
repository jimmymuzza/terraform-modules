resource "aws_vpc_route_server_propagation" "vpc_route_server_propagations" {
  for_each = var.vpc_route_server_propagations

  route_server_id = each.value.route_server_id
  route_table_id  = each.value.route_table_id
  region          = each.value.region
}
