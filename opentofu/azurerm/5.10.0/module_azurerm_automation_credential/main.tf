resource "azurerm_automation_credential" "automation_credentials" {
  for_each = var.automation_credentials

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  password                = each.value.password
  resource_group_name     = each.value.resource_group_name
  username                = each.value.username
  description             = each.value.description
}
