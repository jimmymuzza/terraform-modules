resource "azurerm_frontdoor_custom_https_configuration" "frontdoor_custom_https_configurations" {
  for_each = var.frontdoor_custom_https_configurations

  custom_https_provisioning_enabled = each.value.custom_https_provisioning_enabled
  frontend_endpoint_id              = each.value.frontend_endpoint_id

  dynamic "custom_https_configuration" {
    for_each = each.value.custom_https_configuration != null ? each.value.custom_https_configuration : []
    content {
      azure_key_vault_certificate_secret_name    = custom_https_configuration.value.azure_key_vault_certificate_secret_name
      azure_key_vault_certificate_secret_version = custom_https_configuration.value.azure_key_vault_certificate_secret_version
      azure_key_vault_certificate_vault_id       = custom_https_configuration.value.azure_key_vault_certificate_vault_id
      certificate_source                         = custom_https_configuration.value.certificate_source
    }
  }
}
