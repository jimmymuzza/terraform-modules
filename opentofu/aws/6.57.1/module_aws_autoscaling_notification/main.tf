resource "aws_autoscaling_notification" "autoscaling_notifications" {
  for_each = var.autoscaling_notifications

  group_names   = each.value.group_names
  notifications = each.value.notifications
  topic_arn     = each.value.topic_arn
  region        = each.value.region
}
