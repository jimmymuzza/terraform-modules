resource "azurerm_bot_connection" "bot_connections" {
  for_each = var.bot_connections

  bot_name              = each.value.bot_name
  client_id             = each.value.client_id
  client_secret         = each.value.client_secret
  location              = each.value.location
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  service_provider_name = each.value.service_provider_name
  parameters            = each.value.parameters
  scopes                = each.value.scopes
}
