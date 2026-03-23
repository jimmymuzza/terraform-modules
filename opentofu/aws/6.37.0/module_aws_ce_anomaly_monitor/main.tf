resource "aws_ce_anomaly_monitor" "ce_anomaly_monitors" {
  for_each = var.ce_anomaly_monitors

  monitor_type          = each.value.monitor_type
  name                  = each.value.name
  monitor_dimension     = each.value.monitor_dimension
  monitor_specification = each.value.monitor_specification
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
}
