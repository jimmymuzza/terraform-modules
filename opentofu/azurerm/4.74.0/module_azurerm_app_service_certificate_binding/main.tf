resource "azurerm_app_service_certificate_binding" "app_service_certificate_bindings" {
  for_each = var.app_service_certificate_bindings

  certificate_id      = each.value.certificate_id
  hostname_binding_id = each.value.hostname_binding_id
  ssl_state           = each.value.ssl_state
}
