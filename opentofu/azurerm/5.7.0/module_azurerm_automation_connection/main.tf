resource "azurerm_automation_connection" "automation_connections" {
  for_each = var.automation_connections

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  type                    = each.value.type
  values                  = each.value.values
  description             = each.value.description
}
