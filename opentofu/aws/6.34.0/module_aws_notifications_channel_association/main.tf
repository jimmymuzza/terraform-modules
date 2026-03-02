resource "aws_notifications_channel_association" "notifications_channel_associations" {
  for_each = var.notifications_channel_associations

  arn                            = each.value.arn
  notification_configuration_arn = each.value.notification_configuration_arn
}
