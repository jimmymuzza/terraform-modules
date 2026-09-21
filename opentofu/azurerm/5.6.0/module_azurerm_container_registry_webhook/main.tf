resource "azurerm_container_registry_webhook" "container_registry_webhooks" {
  for_each = var.container_registry_webhooks

  actions             = each.value.actions
  location            = each.value.location
  name                = each.value.name
  registry_name       = each.value.registry_name
  resource_group_name = each.value.resource_group_name
  service_uri         = each.value.service_uri
  custom_headers      = each.value.custom_headers
  scope               = each.value.scope
  status              = each.value.status
  tags                = each.value.tags
}
