resource "azurerm_bot_channel_slack" "bot_channel_slacks" {
  for_each = var.bot_channel_slacks

  bot_name            = each.value.bot_name
  client_id           = each.value.client_id
  client_secret       = each.value.client_secret
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  verification_token  = each.value.verification_token
  landing_page_url    = each.value.landing_page_url
  signing_secret      = each.value.signing_secret
}
