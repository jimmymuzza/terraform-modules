resource "azurerm_elastic_san_volume" "elastic_san_volumes" {
  for_each = var.elastic_san_volumes

  name            = each.value.name
  size_in_gib     = each.value.size_in_gib
  volume_group_id = each.value.volume_group_id

  dynamic "create_source" {
    for_each = each.value.create_source != null ? each.value.create_source : []
    content {
      source_id   = create_source.value.source_id
      source_type = create_source.value.source_type
    }
  }
}
