resource "aws_appmesh_virtual_service" "appmesh_virtual_services" {
  for_each = var.appmesh_virtual_services

  mesh_name  = each.value.mesh_name
  name       = each.value.name
  mesh_owner = each.value.mesh_owner
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {

      dynamic "provider" {
        for_each = spec.value.provider != null ? spec.value.provider : []
        content {

          dynamic "virtual_node" {
            for_each = provider.value.virtual_node != null ? provider.value.virtual_node : []
            content {
              virtual_node_name = virtual_node.value.virtual_node_name
            }
          }

          dynamic "virtual_router" {
            for_each = provider.value.virtual_router != null ? provider.value.virtual_router : []
            content {
              virtual_router_name = virtual_router.value.virtual_router_name
            }
          }
        }
      }
    }
  }
}
