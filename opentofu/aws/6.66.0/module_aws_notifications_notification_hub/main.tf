resource "aws_notifications_notification_hub" "notifications_notification_hubs" {
  for_each = var.notifications_notification_hubs

  notification_hub_region = each.value.notification_hub_region
}
