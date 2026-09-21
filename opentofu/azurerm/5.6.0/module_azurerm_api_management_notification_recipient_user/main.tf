resource "azurerm_api_management_notification_recipient_user" "api_management_notification_recipient_users" {
  for_each = var.api_management_notification_recipient_users

  api_management_id = each.value.api_management_id
  notification_type = each.value.notification_type
  user_id           = each.value.user_id
}
