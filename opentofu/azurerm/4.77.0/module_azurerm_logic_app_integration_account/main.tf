resource "azurerm_logic_app_integration_account" "logic_app_integration_accounts" {
  for_each = var.logic_app_integration_accounts

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  sku_name                           = each.value.sku_name
  integration_service_environment_id = each.value.integration_service_environment_id
  tags                               = each.value.tags
}
