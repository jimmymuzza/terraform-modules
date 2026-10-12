resource "aws_appmesh_virtual_router" "appmesh_virtual_routers" {
  for_each = var.appmesh_virtual_routers

  mesh_name  = each.value.mesh_name
  name       = each.value.name
  mesh_owner = each.value.mesh_owner
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {

      dynamic "listener" {
        for_each = spec.value.listener != null ? spec.value.listener : []
        content {

          dynamic "port_mapping" {
            for_each = listener.value.port_mapping != null ? listener.value.port_mapping : []
            content {
              port     = port_mapping.value.port
              protocol = port_mapping.value.protocol
            }
          }
        }
      }
    }
  }
}
