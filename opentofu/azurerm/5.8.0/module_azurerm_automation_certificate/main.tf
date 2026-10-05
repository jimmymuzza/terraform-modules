resource "azurerm_automation_certificate" "automation_certificates" {
  for_each = var.automation_certificates

  automation_account_name = each.value.automation_account_name
  base64                  = each.value.base64
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  exportable              = each.value.exportable
}
