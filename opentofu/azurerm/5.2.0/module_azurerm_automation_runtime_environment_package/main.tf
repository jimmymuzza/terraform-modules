resource "azurerm_automation_runtime_environment_package" "automation_runtime_environment_packages" {
  for_each = var.automation_runtime_environment_packages

  automation_runtime_environment_id = each.value.automation_runtime_environment_id
  content_uri                       = each.value.content_uri
  name                              = each.value.name
  content_version                   = each.value.content_version
  hash_algorithm                    = each.value.hash_algorithm
  hash_value                        = each.value.hash_value
}
