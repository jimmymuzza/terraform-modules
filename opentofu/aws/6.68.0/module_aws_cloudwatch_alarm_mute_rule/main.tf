resource "aws_cloudwatch_alarm_mute_rule" "cloudwatch_alarm_mute_rules" {
  for_each = var.cloudwatch_alarm_mute_rules

  name        = each.value.name
  description = each.value.description
  expire_date = each.value.expire_date
  region      = each.value.region
  start_date  = each.value.start_date
  tags        = each.value.tags

  dynamic "mute_targets" {
    for_each = each.value.mute_targets != null ? each.value.mute_targets : []
    content {
      alarm_names = mute_targets.value.alarm_names
    }
  }

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {

      dynamic "schedule" {
        for_each = rule.value.schedule != null ? rule.value.schedule : []
        content {
          duration   = schedule.value.duration
          expression = schedule.value.expression
          timezone   = schedule.value.timezone
        }
      }
    }
  }
}
