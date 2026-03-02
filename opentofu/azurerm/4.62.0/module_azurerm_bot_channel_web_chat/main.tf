resource "azurerm_bot_channel_web_chat" "bot_channel_web_chats" {
  for_each = var.bot_channel_web_chats

  bot_name            = each.value.bot_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "site" {
    for_each = each.value.site != null ? each.value.site : []
    content {
      name                        = site.value.name
      endpoint_parameters_enabled = site.value.endpoint_parameters_enabled
      storage_enabled             = site.value.storage_enabled
      user_upload_enabled         = site.value.user_upload_enabled
    }
  }
}
