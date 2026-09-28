resource "azurerm_resource_provider_feature_registration" "resource_provider_feature_registrations" {
  for_each = var.resource_provider_feature_registrations

  name          = each.value.name
  provider_name = each.value.provider_name
}
