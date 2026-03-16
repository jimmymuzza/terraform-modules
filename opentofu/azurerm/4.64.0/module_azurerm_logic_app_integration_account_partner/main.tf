resource "azurerm_logic_app_integration_account_partner" "logic_app_integration_account_partners" {
  for_each = var.logic_app_integration_account_partners

  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata

  dynamic "business_identity" {
    for_each = each.value.business_identity != null ? each.value.business_identity : []
    content {
      qualifier = business_identity.value.qualifier
      value     = business_identity.value.value
    }
  }
}
