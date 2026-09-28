resource "aws_notifications_event_rule" "notifications_event_rules" {
  for_each = var.notifications_event_rules

  event_type                     = each.value.event_type
  notification_configuration_arn = each.value.notification_configuration_arn
  regions                        = each.value.regions
  source                         = each.value.source
  event_pattern                  = each.value.event_pattern
}
