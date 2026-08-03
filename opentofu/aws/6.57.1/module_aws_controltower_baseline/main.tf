resource "aws_controltower_baseline" "controltower_baselines" {
  for_each = var.controltower_baselines

  baseline_identifier = each.value.baseline_identifier
  baseline_version    = each.value.baseline_version
  target_identifier   = each.value.target_identifier
  region              = each.value.region
  tags                = each.value.tags

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      key   = parameters.value.key
      value = parameters.value.value
    }
  }
}
