resource "aws_appmesh_mesh" "appmesh_meshes" {
  for_each = var.appmesh_meshes

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {

      dynamic "egress_filter" {
        for_each = spec.value.egress_filter != null ? spec.value.egress_filter : []
        content {
          type = egress_filter.value.type
        }
      }

      dynamic "service_discovery" {
        for_each = spec.value.service_discovery != null ? spec.value.service_discovery : []
        content {
          ip_preference = service_discovery.value.ip_preference
        }
      }
    }
  }
}
