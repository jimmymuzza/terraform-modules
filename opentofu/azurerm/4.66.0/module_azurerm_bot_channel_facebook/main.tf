resource "azurerm_bot_channel_facebook" "bot_channel_facebooks" {
  for_each = var.bot_channel_facebooks

  bot_name                    = each.value.bot_name
  facebook_application_id     = each.value.facebook_application_id
  facebook_application_secret = each.value.facebook_application_secret
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name

  dynamic "page" {
    for_each = each.value.page != null ? each.value.page : []
    content {
      access_token = page.value.access_token
    }
  }
}
