resource "azurerm_automation_connection_classic_certificate" "automation_connection_classic_certificates" {
  for_each = var.automation_connection_classic_certificates

  automation_account_name = each.value.automation_account_name
  certificate_asset_name  = each.value.certificate_asset_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  subscription_id         = each.value.subscription_id
  subscription_name       = each.value.subscription_name
  description             = each.value.description
}
