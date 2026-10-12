resource "azurerm_logic_app_integration_account_schema" "logic_app_integration_account_schemas" {
  for_each = var.logic_app_integration_account_schemas

  content                  = each.value.content
  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  file_name                = each.value.file_name
  metadata                 = each.value.metadata
}
