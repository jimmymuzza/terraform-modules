resource "aws_arczonalshift_autoshift_observer_notification_status" "arczonalshift_autoshift_observer_notification_status" {
  for_each = var.arczonalshift_autoshift_observer_notification_status

  status = each.value.status
  region = each.value.region
}
