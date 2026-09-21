resource "azurerm_bot_channel_directline" "bot_channel_directlines" {
  for_each = var.bot_channel_directlines

  bot_name            = each.value.bot_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "site" {
    for_each = each.value.site != null ? each.value.site : []
    content {
      name                            = site.value.name
      enabled                         = site.value.enabled
      endpoint_parameters_enabled     = site.value.endpoint_parameters_enabled
      enhanced_authentication_enabled = site.value.enhanced_authentication_enabled
      storage_enabled                 = site.value.storage_enabled
      trusted_origins                 = site.value.trusted_origins
      user_upload_enabled             = site.value.user_upload_enabled
      v1_allowed                      = site.value.v1_allowed
      v3_allowed                      = site.value.v3_allowed
    }
  }
}
