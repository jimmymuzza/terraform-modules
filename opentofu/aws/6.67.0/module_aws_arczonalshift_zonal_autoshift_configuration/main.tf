resource "aws_arczonalshift_zonal_autoshift_configuration" "arczonalshift_zonal_autoshift_configurations" {
  for_each = var.arczonalshift_zonal_autoshift_configurations

  resource_arn           = each.value.resource_arn
  zonal_autoshift_status = each.value.zonal_autoshift_status
  allowed_windows        = each.value.allowed_windows
  blocked_dates          = each.value.blocked_dates
  blocked_windows        = each.value.blocked_windows
  region                 = each.value.region

  dynamic "blocking_alarms" {
    for_each = each.value.blocking_alarms != null ? each.value.blocking_alarms : []
    content {
      alarm_identifier = blocking_alarms.value.alarm_identifier
      type             = blocking_alarms.value.type
    }
  }

  dynamic "outcome_alarms" {
    for_each = each.value.outcome_alarms != null ? each.value.outcome_alarms : []
    content {
      alarm_identifier = outcome_alarms.value.alarm_identifier
      type             = outcome_alarms.value.type
    }
  }
}
