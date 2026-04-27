resource "aws_notifications_notification_configuration" "notifications_notification_configurations" {
  for_each = var.notifications_notification_configurations

  description          = each.value.description
  name                 = each.value.name
  aggregation_duration = each.value.aggregation_duration
  tags                 = each.value.tags
}
