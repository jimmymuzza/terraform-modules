resource "aws_route_table" "route_tables" {
  for_each = var.route_tables

  vpc_id           = each.value.vpc_id
  propagating_vgws = each.value.propagating_vgws
  region           = each.value.region
  route            = each.value.route
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
