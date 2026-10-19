resource "azurerm_automation_powershell72_module" "automation_powershell72_modules" {
  for_each = var.automation_powershell72_modules

  automation_account_id = each.value.automation_account_id
  name                  = each.value.name
  tags                  = each.value.tags

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
