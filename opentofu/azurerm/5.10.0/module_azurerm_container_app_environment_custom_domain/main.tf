resource "azurerm_container_app_environment_custom_domain" "container_app_environment_custom_domains" {
  for_each = var.container_app_environment_custom_domains

  certificate_blob_base64      = each.value.certificate_blob_base64
  certificate_password         = each.value.certificate_password
  container_app_environment_id = each.value.container_app_environment_id
  dns_suffix                   = each.value.dns_suffix
}
