resource "azurerm_automation_dsc_configuration" "automation_dsc_configurations" {
  for_each = var.automation_dsc_configurations

  automation_account_name = each.value.automation_account_name
  content_embedded        = each.value.content_embedded
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  log_verbose             = each.value.log_verbose
  tags                    = each.value.tags
}
