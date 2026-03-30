resource "azurerm_bot_channel_line" "bot_channel_lines" {
  for_each = var.bot_channel_lines

  bot_name            = each.value.bot_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "line_channel" {
    for_each = each.value.line_channel != null ? each.value.line_channel : []
    content {
      access_token = line_channel.value.access_token
      secret       = line_channel.value.secret
    }
  }
}
