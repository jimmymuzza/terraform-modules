resource "azurerm_automation_module" "automation_modules" {
  for_each = var.automation_modules

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name

  dynamic "module_link" {
    for_each = each.value.module_link != null ? each.value.module_link : []
    content {
      uri = module_link.value.uri

      dynamic "hash" {
        for_each = module_link.value.hash != null ? module_link.value.hash : []
        content {
          algorithm = hash.value.algorithm
          value     = hash.value.value
        }
      }
    }
  }
}
