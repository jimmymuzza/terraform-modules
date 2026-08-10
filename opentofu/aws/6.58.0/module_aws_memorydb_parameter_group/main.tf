resource "aws_memorydb_parameter_group" "memorydb_parameter_groups" {
  for_each = var.memorydb_parameter_groups

  family      = each.value.family
  description = each.value.description
  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
