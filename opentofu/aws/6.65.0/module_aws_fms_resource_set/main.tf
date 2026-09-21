resource "aws_fms_resource_set" "fms_resource_sets" {
  for_each = var.fms_resource_sets

  region = each.value.region
  tags   = each.value.tags

  dynamic "resource_set" {
    for_each = each.value.resource_set != null ? each.value.resource_set : []
    content {
      name                = resource_set.value.name
      description         = resource_set.value.description
      resource_set_status = resource_set.value.resource_set_status
      resource_type_list  = resource_set.value.resource_type_list
      update_token        = resource_set.value.update_token
    }
  }
}
