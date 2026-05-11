resource "azurerm_bot_service_azure_bot" "bot_service_azure_bots" {
  for_each = var.bot_service_azure_bots

  location                              = each.value.location
  microsoft_app_id                      = each.value.microsoft_app_id
  name                                  = each.value.name
  resource_group_name                   = each.value.resource_group_name
  sku                                   = each.value.sku
  cmk_key_vault_key_url                 = each.value.cmk_key_vault_key_url
  developer_app_insights_api_key        = each.value.developer_app_insights_api_key
  developer_app_insights_application_id = each.value.developer_app_insights_application_id
  developer_app_insights_key            = each.value.developer_app_insights_key
  display_name                          = each.value.display_name
  endpoint                              = each.value.endpoint
  icon_url                              = each.value.icon_url
  local_authentication_enabled          = each.value.local_authentication_enabled
  luis_app_ids                          = each.value.luis_app_ids
  luis_key                              = each.value.luis_key
  microsoft_app_msi_id                  = each.value.microsoft_app_msi_id
  microsoft_app_tenant_id               = each.value.microsoft_app_tenant_id
  microsoft_app_type                    = each.value.microsoft_app_type
  public_network_access_enabled         = each.value.public_network_access_enabled
  streaming_endpoint_enabled            = each.value.streaming_endpoint_enabled
  tags                                  = each.value.tags
}
