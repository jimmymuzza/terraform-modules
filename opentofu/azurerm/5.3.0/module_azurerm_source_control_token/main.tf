resource "azurerm_source_control_token" "source_control_tokens" {
  for_each = var.source_control_tokens

  token        = each.value.token
  type         = each.value.type
  token_secret = each.value.token_secret
}
