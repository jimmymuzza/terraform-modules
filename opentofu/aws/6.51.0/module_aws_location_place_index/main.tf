resource "aws_location_place_index" "location_place_indexes" {
  for_each = var.location_place_indexes

  data_source = each.value.data_source
  index_name  = each.value.index_name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "data_source_configuration" {
    for_each = each.value.data_source_configuration != null ? each.value.data_source_configuration : []
    content {
      intended_use = data_source_configuration.value.intended_use
    }
  }
}
