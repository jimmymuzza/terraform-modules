resource "aws_iot_thing_group" "iot_thing_groups" {
  for_each = var.iot_thing_groups

  name              = each.value.name
  parent_group_name = each.value.parent_group_name
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "properties" {
    for_each = each.value.properties != null ? each.value.properties : []
    content {
      description = properties.value.description

      dynamic "attribute_payload" {
        for_each = properties.value.attribute_payload != null ? properties.value.attribute_payload : []
        content {
          attributes = attribute_payload.value.attributes
        }
      }
    }
  }
}
