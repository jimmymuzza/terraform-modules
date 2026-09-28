resource "aws_dax_parameter_group" "dax_parameter_groups" {
  for_each = var.dax_parameter_groups

  name        = each.value.name
  description = each.value.description
  region      = each.value.region

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      name  = parameters.value.name
      value = parameters.value.value
    }
  }
}
