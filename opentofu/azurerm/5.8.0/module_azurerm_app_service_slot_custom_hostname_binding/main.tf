resource "azurerm_app_service_slot_custom_hostname_binding" "app_service_slot_custom_hostname_bindings" {
  for_each = var.app_service_slot_custom_hostname_bindings

  app_service_slot_id = each.value.app_service_slot_id
  hostname            = each.value.hostname
  ssl_state           = each.value.ssl_state
  thumbprint          = each.value.thumbprint
}
