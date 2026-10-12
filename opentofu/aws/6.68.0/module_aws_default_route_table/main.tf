resource "aws_default_route_table" "default_route_tables" {
  for_each = var.default_route_tables

  default_route_table_id = each.value.default_route_table_id
  propagating_vgws       = each.value.propagating_vgws
  region                 = each.value.region
  route                  = each.value.route
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
