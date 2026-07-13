resource "azurerm_spring_cloud_builder" "spring_cloud_builders" {
  for_each = var.spring_cloud_builders

  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id

  dynamic "build_pack_group" {
    for_each = each.value.build_pack_group != null ? each.value.build_pack_group : []
    content {
      name           = build_pack_group.value.name
      build_pack_ids = build_pack_group.value.build_pack_ids
    }
  }

  dynamic "stack" {
    for_each = each.value.stack != null ? each.value.stack : []
    content {
      version = stack.value.version
    }
  }
}
