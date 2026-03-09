resource "azurerm_container_app_environment_certificate" "container_app_environment_certificates" {
  for_each = var.container_app_environment_certificates

  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  certificate_blob_base64      = each.value.certificate_blob_base64
  certificate_password         = each.value.certificate_password
  tags                         = each.value.tags

  dynamic "certificate_key_vault" {
    for_each = each.value.certificate_key_vault != null ? each.value.certificate_key_vault : []
    content {
      key_vault_secret_id = certificate_key_vault.value.key_vault_secret_id
      identity            = certificate_key_vault.value.identity
    }
  }
}
