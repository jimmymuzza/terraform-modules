resource "aws_ssm_maintenance_window_target" "ssm_maintenance_window_targets" {
  for_each = var.ssm_maintenance_window_targets

  resource_type     = each.value.resource_type
  window_id         = each.value.window_id
  description       = each.value.description
  name              = each.value.name
  owner_information = each.value.owner_information
  region            = each.value.region

  dynamic "targets" {
    for_each = each.value.targets != null ? each.value.targets : []
    content {
      key    = targets.value.key
      values = targets.value.values
    }
  }
}
