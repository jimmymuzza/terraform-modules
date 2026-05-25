resource "azurerm_automation_variable_string" "automation_variable_strings" {
  for_each = var.automation_variable_strings

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  encrypted               = each.value.encrypted
  value                   = each.value.value
}
