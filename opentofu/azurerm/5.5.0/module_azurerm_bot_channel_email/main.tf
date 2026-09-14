resource "azurerm_bot_channel_email" "bot_channel_emails" {
  for_each = var.bot_channel_emails

  bot_name            = each.value.bot_name
  email_address       = each.value.email_address
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  email_password      = each.value.email_password
  magic_code          = each.value.magic_code
}
