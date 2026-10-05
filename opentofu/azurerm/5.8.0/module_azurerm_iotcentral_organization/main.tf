resource "azurerm_iotcentral_organization" "iotcentral_organizations" {
  for_each = var.iotcentral_organizations

  display_name              = each.value.display_name
  iotcentral_application_id = each.value.iotcentral_application_id
  organization_id           = each.value.organization_id
  parent_organization_id    = each.value.parent_organization_id
}
