resource "aws_main_route_table_association" "main_route_table_associations" {
  for_each = var.main_route_table_associations

  route_table_id = each.value.route_table_id
  vpc_id         = each.value.vpc_id
  region         = each.value.region
}
