resource "aws_cloudwatch_composite_alarm" "cloudwatch_composite_alarms" {
  for_each = var.cloudwatch_composite_alarms

  alarm_name                = each.value.alarm_name
  alarm_rule                = each.value.alarm_rule
  actions_enabled           = each.value.actions_enabled
  alarm_actions             = each.value.alarm_actions
  alarm_description         = each.value.alarm_description
  insufficient_data_actions = each.value.insufficient_data_actions
  ok_actions                = each.value.ok_actions
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "actions_suppressor" {
    for_each = each.value.actions_suppressor != null ? each.value.actions_suppressor : []
    content {
      alarm            = actions_suppressor.value.alarm
      extension_period = actions_suppressor.value.extension_period
      wait_period      = actions_suppressor.value.wait_period
    }
  }
}
