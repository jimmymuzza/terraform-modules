resource "azurerm_logic_app_integration_account_agreement" "logic_app_integration_account_agreements" {
  for_each = var.logic_app_integration_account_agreements

  agreement_type           = each.value.agreement_type
  content                  = each.value.content
  guest_partner_name       = each.value.guest_partner_name
  host_partner_name        = each.value.host_partner_name
  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata

  dynamic "guest_identity" {
    for_each = each.value.guest_identity != null ? each.value.guest_identity : []
    content {
      qualifier = guest_identity.value.qualifier
      value     = guest_identity.value.value
    }
  }

  dynamic "host_identity" {
    for_each = each.value.host_identity != null ? each.value.host_identity : []
    content {
      qualifier = host_identity.value.qualifier
      value     = host_identity.value.value
    }
  }
}
