resource "azurerm_spring_cloud_build_pack_binding" "spring_cloud_build_pack_bindings" {
  for_each = var.spring_cloud_build_pack_bindings

  name                    = each.value.name
  spring_cloud_builder_id = each.value.spring_cloud_builder_id
  binding_type            = each.value.binding_type

  dynamic "launch" {
    for_each = each.value.launch != null ? each.value.launch : []
    content {
      properties = launch.value.properties
      secrets    = launch.value.secrets
    }
  }
}
