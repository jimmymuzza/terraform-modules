resource "azurerm_api_management_custom_domain" "api_management_custom_domains" {
  for_each = var.api_management_custom_domains

  api_management_id = each.value.api_management_id

  dynamic "developer_portal" {
    for_each = each.value.developer_portal != null ? each.value.developer_portal : []
    content {
      host_name                       = developer_portal.value.host_name
      certificate                     = developer_portal.value.certificate
      certificate_password            = developer_portal.value.certificate_password
      key_vault_certificate_id        = developer_portal.value.key_vault_certificate_id
      negotiate_client_certificate    = developer_portal.value.negotiate_client_certificate
      ssl_keyvault_identity_client_id = developer_portal.value.ssl_keyvault_identity_client_id
    }
  }

  dynamic "gateway" {
    for_each = each.value.gateway != null ? each.value.gateway : []
    content {
      host_name                       = gateway.value.host_name
      certificate                     = gateway.value.certificate
      certificate_password            = gateway.value.certificate_password
      default_ssl_binding             = gateway.value.default_ssl_binding
      key_vault_certificate_id        = gateway.value.key_vault_certificate_id
      negotiate_client_certificate    = gateway.value.negotiate_client_certificate
      ssl_keyvault_identity_client_id = gateway.value.ssl_keyvault_identity_client_id
    }
  }

  dynamic "management" {
    for_each = each.value.management != null ? each.value.management : []
    content {
      host_name                       = management.value.host_name
      certificate                     = management.value.certificate
      certificate_password            = management.value.certificate_password
      key_vault_certificate_id        = management.value.key_vault_certificate_id
      negotiate_client_certificate    = management.value.negotiate_client_certificate
      ssl_keyvault_identity_client_id = management.value.ssl_keyvault_identity_client_id
    }
  }

  dynamic "portal" {
    for_each = each.value.portal != null ? each.value.portal : []
    content {
      host_name                       = portal.value.host_name
      certificate                     = portal.value.certificate
      certificate_password            = portal.value.certificate_password
      key_vault_certificate_id        = portal.value.key_vault_certificate_id
      negotiate_client_certificate    = portal.value.negotiate_client_certificate
      ssl_keyvault_identity_client_id = portal.value.ssl_keyvault_identity_client_id
    }
  }

  dynamic "scm" {
    for_each = each.value.scm != null ? each.value.scm : []
    content {
      host_name                       = scm.value.host_name
      certificate                     = scm.value.certificate
      certificate_password            = scm.value.certificate_password
      key_vault_certificate_id        = scm.value.key_vault_certificate_id
      negotiate_client_certificate    = scm.value.negotiate_client_certificate
      ssl_keyvault_identity_client_id = scm.value.ssl_keyvault_identity_client_id
    }
  }
}
