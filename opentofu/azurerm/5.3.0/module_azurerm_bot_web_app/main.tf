resource "azurerm_bot_web_app" "bot_web_apps" {
  for_each = var.bot_web_apps

  location                                = each.value.location
  microsoft_app_id                        = each.value.microsoft_app_id
  microsoft_app_type                      = each.value.microsoft_app_type
  name                                    = each.value.name
  resource_group_name                     = each.value.resource_group_name
  sku                                     = each.value.sku
  developer_app_insights_api_key          = each.value.developer_app_insights_api_key
  developer_app_insights_application_id   = each.value.developer_app_insights_application_id
  developer_app_insights_key              = each.value.developer_app_insights_key
  display_name                            = each.value.display_name
  endpoint                                = each.value.endpoint
  luis_app_ids                            = each.value.luis_app_ids
  luis_key                                = each.value.luis_key
  microsoft_app_tenant_id                 = each.value.microsoft_app_tenant_id
  microsoft_app_user_assigned_identity_id = each.value.microsoft_app_user_assigned_identity_id
  tags                                    = each.value.tags
}
