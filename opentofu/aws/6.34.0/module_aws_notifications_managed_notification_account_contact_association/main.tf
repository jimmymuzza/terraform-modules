resource "aws_notifications_managed_notification_account_contact_association" "notifications_managed_notification_account_contact_associations" {
  for_each = var.notifications_managed_notification_account_contact_associations

  contact_identifier                     = each.value.contact_identifier
  managed_notification_configuration_arn = each.value.managed_notification_configuration_arn
}
