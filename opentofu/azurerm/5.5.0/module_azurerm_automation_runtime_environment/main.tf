resource "azurerm_automation_runtime_environment" "automation_runtime_environments" {
  for_each = var.automation_runtime_environments

  automation_account_id    = each.value.automation_account_id
  location                 = each.value.location
  name                     = each.value.name
  runtime_language         = each.value.runtime_language
  runtime_version          = each.value.runtime_version
  description              = each.value.description
  runtime_default_packages = each.value.runtime_default_packages
  tags                     = each.value.tags
}
