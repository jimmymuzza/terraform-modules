resource "azurerm_automation_connection_certificate" "automation_connection_certificates" {
  for_each = var.automation_connection_certificates

  automation_account_name     = each.value.automation_account_name
  automation_certificate_name = each.value.automation_certificate_name
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  subscription_id             = each.value.subscription_id
  description                 = each.value.description
}
