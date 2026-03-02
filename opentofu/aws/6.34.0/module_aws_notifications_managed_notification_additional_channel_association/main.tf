resource "aws_notifications_managed_notification_additional_channel_association" "notifications_managed_notification_additional_channel_associations" {
  for_each = var.notifications_managed_notification_additional_channel_associations

  channel_arn              = each.value.channel_arn
  managed_notification_arn = each.value.managed_notification_arn
}
