resource "azurerm_container_app_custom_domain" "container_app_custom_domains" {
  for_each = var.container_app_custom_domains

  container_app_id                         = each.value.container_app_id
  name                                     = each.value.name
  certificate_binding_type                 = each.value.certificate_binding_type
  container_app_environment_certificate_id = each.value.container_app_environment_certificate_id
}
