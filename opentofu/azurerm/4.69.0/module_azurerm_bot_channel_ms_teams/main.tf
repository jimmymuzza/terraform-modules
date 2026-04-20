resource "azurerm_bot_channel_ms_teams" "bot_channel_ms_teams" {
  for_each = var.bot_channel_ms_teams

  bot_name               = each.value.bot_name
  location               = each.value.location
  resource_group_name    = each.value.resource_group_name
  calling_enabled        = each.value.calling_enabled
  calling_web_hook       = each.value.calling_web_hook
  deployment_environment = each.value.deployment_environment
  enable_calling         = each.value.enable_calling
}
