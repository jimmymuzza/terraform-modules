resource "aws_route_table_association" "route_table_associations" {
  for_each = var.route_table_associations

  route_table_id = each.value.route_table_id
  gateway_id     = each.value.gateway_id
  region         = each.value.region
  subnet_id      = each.value.subnet_id
}
