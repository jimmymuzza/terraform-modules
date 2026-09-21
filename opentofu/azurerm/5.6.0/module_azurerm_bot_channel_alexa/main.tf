resource "azurerm_bot_channel_alexa" "bot_channel_alexas" {
  for_each = var.bot_channel_alexas

  bot_name            = each.value.bot_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  skill_id            = each.value.skill_id
}
