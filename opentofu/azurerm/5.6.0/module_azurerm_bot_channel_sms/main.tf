resource "azurerm_bot_channel_sms" "bot_channel_sms" {
  for_each = var.bot_channel_sms

  bot_name                        = each.value.bot_name
  location                        = each.value.location
  phone_number                    = each.value.phone_number
  resource_group_name             = each.value.resource_group_name
  sms_channel_account_security_id = each.value.sms_channel_account_security_id
  sms_channel_auth_token          = each.value.sms_channel_auth_token
}
