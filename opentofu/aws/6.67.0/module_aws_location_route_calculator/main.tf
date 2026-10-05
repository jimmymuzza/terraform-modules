resource "aws_location_route_calculator" "location_route_calculators" {
  for_each = var.location_route_calculators

  calculator_name = each.value.calculator_name
  data_source     = each.value.data_source
  description     = each.value.description
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
