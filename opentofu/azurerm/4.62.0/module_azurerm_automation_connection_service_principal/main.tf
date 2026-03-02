resource "azurerm_automation_connection_service_principal" "automation_connection_service_principals" {
  for_each = var.automation_connection_service_principals

  application_id          = each.value.application_id
  automation_account_name = each.value.automation_account_name
  certificate_thumbprint  = each.value.certificate_thumbprint
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  subscription_id         = each.value.subscription_id
  tenant_id               = each.value.tenant_id
  description             = each.value.description
}
