resource "aws_networkmonitor_monitor" "networkmonitor_monitors" {
  for_each = var.networkmonitor_monitors

  monitor_name       = each.value.monitor_name
  aggregation_period = each.value.aggregation_period
  region             = each.value.region
  tags               = each.value.tags
}
