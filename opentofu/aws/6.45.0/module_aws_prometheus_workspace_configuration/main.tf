resource "aws_prometheus_workspace_configuration" "prometheus_workspace_configurations" {
  for_each = var.prometheus_workspace_configurations

  workspace_id             = each.value.workspace_id
  region                   = each.value.region
  retention_period_in_days = each.value.retention_period_in_days

  dynamic "limits_per_label_set" {
    for_each = each.value.limits_per_label_set != null ? each.value.limits_per_label_set : []
    content {
      label_set = limits_per_label_set.value.label_set

      dynamic "limits" {
        for_each = limits_per_label_set.value.limits != null ? limits_per_label_set.value.limits : []
        content {
          max_series = limits.value.max_series
        }
      }
    }
  }
}
