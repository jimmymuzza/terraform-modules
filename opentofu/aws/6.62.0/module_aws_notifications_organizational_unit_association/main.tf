resource "aws_notifications_organizational_unit_association" "notifications_organizational_unit_associations" {
  for_each = var.notifications_organizational_unit_associations

  notification_configuration_arn = each.value.notification_configuration_arn
  organizational_unit_id         = each.value.organizational_unit_id
}
