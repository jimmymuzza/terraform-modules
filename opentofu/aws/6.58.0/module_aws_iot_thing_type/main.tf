resource "aws_iot_thing_type" "iot_thing_types" {
  for_each = var.iot_thing_types

  name       = each.value.name
  deprecated = each.value.deprecated
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "properties" {
    for_each = each.value.properties != null ? each.value.properties : []
    content {
      description           = properties.value.description
      searchable_attributes = properties.value.searchable_attributes
    }
  }
}
