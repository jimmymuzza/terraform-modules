resource "aws_iot_thing" "iot_things" {
  for_each = var.iot_things

  name            = each.value.name
  attributes      = each.value.attributes
  region          = each.value.region
  thing_type_name = each.value.thing_type_name
}
