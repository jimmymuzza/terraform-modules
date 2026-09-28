resource "azurerm_api_management" "api_managements" {
  for_each = var.api_managements

  location                      = each.value.location
  name                          = each.value.name
  publisher_email               = each.value.publisher_email
  publisher_name                = each.value.publisher_name
  resource_group_name           = each.value.resource_group_name
  sku_name                      = each.value.sku_name
  client_certificate_enabled    = each.value.client_certificate_enabled
  gateway_disabled              = each.value.gateway_disabled
  min_api_version               = each.value.min_api_version
  notification_sender_email     = each.value.notification_sender_email
  public_ip_address_id          = each.value.public_ip_address_id
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
  virtual_network_type          = each.value.virtual_network_type
  zones                         = each.value.zones

  dynamic "additional_location" {
    for_each = each.value.additional_location != null ? each.value.additional_location : []
    content {
      location             = additional_location.value.location
      capacity             = additional_location.value.capacity
      gateway_disabled     = additional_location.value.gateway_disabled
      public_ip_address_id = additional_location.value.public_ip_address_id
      zones                = additional_location.value.zones

      dynamic "virtual_network_configuration" {
        for_each = additional_location.value.virtual_network_configuration != null ? additional_location.value.virtual_network_configuration : []
        content {
          subnet_id = virtual_network_configuration.value.subnet_id
        }
      }
    }
  }

  dynamic "certificate" {
    for_each = each.value.certificate != null ? each.value.certificate : []
    content {
      encoded_certificate  = certificate.value.encoded_certificate
      store_name           = certificate.value.store_name
      certificate_password = certificate.value.certificate_password
    }
  }

  dynamic "delegation" {
    for_each = each.value.delegation != null ? each.value.delegation : []
    content {
      subscriptions_enabled     = delegation.value.subscriptions_enabled
      url                       = delegation.value.url
      user_registration_enabled = delegation.value.user_registration_enabled
      validation_key            = delegation.value.validation_key
    }
  }

  dynamic "hostname_configuration" {
    for_each = each.value.hostname_configuration != null ? each.value.hostname_configuration : []
    content {

      dynamic "developer_portal" {
        for_each = hostname_configuration.value.developer_portal != null ? hostname_configuration.value.developer_portal : []
        content {
          host_name                       = developer_portal.value.host_name
          certificate                     = developer_portal.value.certificate
          certificate_password            = developer_portal.value.certificate_password
          key_vault_certificate_id        = developer_portal.value.key_vault_certificate_id
          negotiate_client_certificate    = developer_portal.value.negotiate_client_certificate
          ssl_keyvault_identity_client_id = developer_portal.value.ssl_keyvault_identity_client_id
        }
      }

      dynamic "management" {
        for_each = hostname_configuration.value.management != null ? hostname_configuration.value.management : []
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
        for_each = hostname_configuration.value.portal != null ? hostname_configuration.value.portal : []
        content {
          host_name                       = portal.value.host_name
          certificate                     = portal.value.certificate
          certificate_password            = portal.value.certificate_password
          key_vault_certificate_id        = portal.value.key_vault_certificate_id
          negotiate_client_certificate    = portal.value.negotiate_client_certificate
          ssl_keyvault_identity_client_id = portal.value.ssl_keyvault_identity_client_id
        }
      }

      dynamic "proxy" {
        for_each = hostname_configuration.value.proxy != null ? hostname_configuration.value.proxy : []
        content {
          host_name                       = proxy.value.host_name
          certificate                     = proxy.value.certificate
          certificate_password            = proxy.value.certificate_password
          default_ssl_binding             = proxy.value.default_ssl_binding
          key_vault_certificate_id        = proxy.value.key_vault_certificate_id
          negotiate_client_certificate    = proxy.value.negotiate_client_certificate
          ssl_keyvault_identity_client_id = proxy.value.ssl_keyvault_identity_client_id
        }
      }

      dynamic "scm" {
        for_each = hostname_configuration.value.scm != null ? hostname_configuration.value.scm : []
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
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "protocols" {
    for_each = each.value.protocols != null ? each.value.protocols : []
    content {
      http2_enabled = protocols.value.http2_enabled
    }
  }

  dynamic "security" {
    for_each = each.value.security != null ? each.value.security : []
    content {
      backend_ssl30_enabled                               = security.value.backend_ssl30_enabled
      backend_tls10_enabled                               = security.value.backend_tls10_enabled
      backend_tls11_enabled                               = security.value.backend_tls11_enabled
      frontend_ssl30_enabled                              = security.value.frontend_ssl30_enabled
      frontend_tls10_enabled                              = security.value.frontend_tls10_enabled
      frontend_tls11_enabled                              = security.value.frontend_tls11_enabled
      tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = security.value.tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled
      tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = security.value.tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled
      tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = security.value.tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled
      tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = security.value.tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled
      tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = security.value.tls_rsa_with_aes128_cbc_sha256_ciphers_enabled
      tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = security.value.tls_rsa_with_aes128_cbc_sha_ciphers_enabled
      tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = security.value.tls_rsa_with_aes128_gcm_sha256_ciphers_enabled
      tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = security.value.tls_rsa_with_aes256_cbc_sha256_ciphers_enabled
      tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = security.value.tls_rsa_with_aes256_cbc_sha_ciphers_enabled
      tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = security.value.tls_rsa_with_aes256_gcm_sha384_ciphers_enabled
      triple_des_ciphers_enabled                          = security.value.triple_des_ciphers_enabled
    }
  }

  dynamic "sign_in" {
    for_each = each.value.sign_in != null ? each.value.sign_in : []
    content {
      enabled = sign_in.value.enabled
    }
  }

  dynamic "sign_up" {
    for_each = each.value.sign_up != null ? each.value.sign_up : []
    content {
      enabled = sign_up.value.enabled

      dynamic "terms_of_service" {
        for_each = sign_up.value.terms_of_service != null ? sign_up.value.terms_of_service : []
        content {
          consent_required = terms_of_service.value.consent_required
          enabled          = terms_of_service.value.enabled
          text             = terms_of_service.value.text
        }
      }
    }
  }

  dynamic "tenant_access" {
    for_each = each.value.tenant_access != null ? each.value.tenant_access : []
    content {
      enabled = tenant_access.value.enabled
    }
  }

  dynamic "virtual_network_configuration" {
    for_each = each.value.virtual_network_configuration != null ? each.value.virtual_network_configuration : []
    content {
      subnet_id = virtual_network_configuration.value.subnet_id
    }
  }
}
