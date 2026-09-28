resource "aws_devopsguru_resource_collection" "devopsguru_resource_collections" {
  for_each = var.devopsguru_resource_collections

  type   = each.value.type
  region = each.value.region

  dynamic "cloudformation" {
    for_each = each.value.cloudformation != null ? each.value.cloudformation : []
    content {
      stack_names = cloudformation.value.stack_names
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      app_boundary_key = tags.value.app_boundary_key
      tag_values       = tags.value.tag_values
    }
  }
}
