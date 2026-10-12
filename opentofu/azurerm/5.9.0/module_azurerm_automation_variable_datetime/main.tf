resource "azurerm_automation_variable_datetime" "automation_variable_datetimes" {
  for_each = var.automation_variable_datetimes

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  encrypted               = each.value.encrypted
  value                   = each.value.value
}
