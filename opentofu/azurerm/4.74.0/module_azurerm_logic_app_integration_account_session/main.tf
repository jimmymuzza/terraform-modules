resource "azurerm_logic_app_integration_account_session" "logic_app_integration_account_sessions" {
  for_each = var.logic_app_integration_account_sessions

  content                  = each.value.content
  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
}
