resource "azurerm_automation_python3_package" "automation_python3_packages" {
  for_each = var.automation_python3_packages

  automation_account_name = each.value.automation_account_name
  content_uri             = each.value.content_uri
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  content_version         = each.value.content_version
  hash_algorithm          = each.value.hash_algorithm
  hash_value              = each.value.hash_value
  tags                    = each.value.tags
}
