resource "aws_vpc_route_server_endpoint" "vpc_route_server_endpoints" {
  for_each = var.vpc_route_server_endpoints

  route_server_id = each.value.route_server_id
  subnet_id       = each.value.subnet_id
  region          = each.value.region
  tags            = each.value.tags
}
