resource "aws_redshift_parameter_group" "redshift_parameter_groups" {
  for_each = var.redshift_parameter_groups

  family      = each.value.family
  name        = each.value.name
  description = each.value.description
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
