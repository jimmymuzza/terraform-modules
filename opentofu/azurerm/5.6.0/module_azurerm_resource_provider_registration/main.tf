resource "azurerm_resource_provider_registration" "resource_provider_registrations" {
  for_each = var.resource_provider_registrations

  name = each.value.name

  dynamic "feature" {
    for_each = each.value.feature != null ? each.value.feature : []
    content {
      name       = feature.value.name
      registered = feature.value.registered
    }
  }
}
