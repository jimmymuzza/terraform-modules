resource "azurerm_api_management_notification_recipient_email" "api_management_notification_recipient_emails" {
  for_each = var.api_management_notification_recipient_emails

  api_management_id = each.value.api_management_id
  email             = each.value.email
  notification_type = each.value.notification_type
}
