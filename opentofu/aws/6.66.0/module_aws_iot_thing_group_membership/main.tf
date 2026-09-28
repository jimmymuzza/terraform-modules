resource "aws_iot_thing_group_membership" "iot_thing_group_memberships" {
  for_each = var.iot_thing_group_memberships

  thing_group_name       = each.value.thing_group_name
  thing_name             = each.value.thing_name
  override_dynamic_group = each.value.override_dynamic_group
  region                 = each.value.region
}
