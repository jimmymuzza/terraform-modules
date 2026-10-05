resource "aws_appstream_fleet_stack_association" "appstream_fleet_stack_associations" {
  for_each = var.appstream_fleet_stack_associations

  fleet_name = each.value.fleet_name
  stack_name = each.value.stack_name
  region     = each.value.region
}
