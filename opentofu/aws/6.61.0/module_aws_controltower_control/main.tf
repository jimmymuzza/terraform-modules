resource "aws_controltower_control" "controltower_controls" {
  for_each = var.controltower_controls

  control_identifier = each.value.control_identifier
  target_identifier  = each.value.target_identifier
  region             = each.value.region

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      key   = parameters.value.key
      value = parameters.value.value
    }
  }
}
