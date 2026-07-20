resource "azurerm_app_service_source_control_token" "app_service_source_control_tokens" {
  for_each = var.app_service_source_control_tokens

  token        = each.value.token
  type         = each.value.type
  token_secret = each.value.token_secret
}
