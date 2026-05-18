variable "api_managements" {
  description = <<EOT
Map of api_managements, attributes below
Required:
    - location
    - name
    - publisher_email
    - publisher_name
    - resource_group_name
    - sku_name
Optional:
    - client_certificate_enabled
    - gateway_disabled
    - min_api_version
    - notification_sender_email
    - public_ip_address_id
    - public_network_access_enabled
    - tags
    - virtual_network_type
    - zones
    - additional_location
    - certificate
    - delegation
    - hostname_configuration
    - identity
    - protocols
    - security
    - sign_in
    - sign_up
    - tenant_access
    - virtual_network_configuration
EOT

  type = map(object({
    location                      = string
    name                          = string
    publisher_email               = string
    publisher_name                = string
    resource_group_name           = string
    sku_name                      = string
    client_certificate_enabled    = optional(bool)
    gateway_disabled              = optional(bool)
    min_api_version               = optional(string)
    notification_sender_email     = optional(string)
    public_ip_address_id          = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    virtual_network_type          = optional(string)
    zones                         = optional(set(string))
    additional_location           = optional(list(object({
            location                      = string
            capacity                      = optional(number)
            gateway_disabled              = optional(bool)
            public_ip_address_id          = optional(string)
            zones                         = optional(set(string))
            virtual_network_configuration = optional(list(object({
                subnet_id = string
            })))
        })))
    certificate                   = optional(list(object({
            encoded_certificate  = string
            store_name           = string
            certificate_password = optional(string)
        })))
    delegation                    = optional(list(object({
            subscriptions_enabled     = optional(bool)
            url                       = optional(string)
            user_registration_enabled = optional(bool)
            validation_key            = optional(string)
        })))
    hostname_configuration        = optional(list(object({
            developer_portal = optional(list(object({
                host_name                       = string
                certificate                     = optional(string)
                certificate_password            = optional(string)
                key_vault_certificate_id        = optional(string)
                key_vault_id                    = optional(string)
                negotiate_client_certificate    = optional(bool)
                ssl_keyvault_identity_client_id = optional(string)
            })))
            management       = optional(list(object({
                host_name                       = string
                certificate                     = optional(string)
                certificate_password            = optional(string)
                key_vault_certificate_id        = optional(string)
                key_vault_id                    = optional(string)
                negotiate_client_certificate    = optional(bool)
                ssl_keyvault_identity_client_id = optional(string)
            })))
            portal           = optional(list(object({
                host_name                       = string
                certificate                     = optional(string)
                certificate_password            = optional(string)
                key_vault_certificate_id        = optional(string)
                key_vault_id                    = optional(string)
                negotiate_client_certificate    = optional(bool)
                ssl_keyvault_identity_client_id = optional(string)
            })))
            proxy            = optional(list(object({
                host_name                       = string
                certificate                     = optional(string)
                certificate_password            = optional(string)
                default_ssl_binding             = optional(bool)
                key_vault_certificate_id        = optional(string)
                key_vault_id                    = optional(string)
                negotiate_client_certificate    = optional(bool)
                ssl_keyvault_identity_client_id = optional(string)
            })))
            scm              = optional(list(object({
                host_name                       = string
                certificate                     = optional(string)
                certificate_password            = optional(string)
                key_vault_certificate_id        = optional(string)
                key_vault_id                    = optional(string)
                negotiate_client_certificate    = optional(bool)
                ssl_keyvault_identity_client_id = optional(string)
            })))
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    protocols                     = optional(list(object({
            enable_http2  = optional(bool)
            http2_enabled = optional(bool)
        })))
    security                      = optional(list(object({
            backend_ssl30_enabled                               = optional(bool)
            backend_tls10_enabled                               = optional(bool)
            backend_tls11_enabled                               = optional(bool)
            enable_backend_ssl30                                = optional(bool)
            enable_backend_tls10                                = optional(bool)
            enable_backend_tls11                                = optional(bool)
            enable_frontend_ssl30                               = optional(bool)
            enable_frontend_tls10                               = optional(bool)
            enable_frontend_tls11                               = optional(bool)
            frontend_ssl30_enabled                              = optional(bool)
            frontend_tls10_enabled                              = optional(bool)
            frontend_tls11_enabled                              = optional(bool)
            tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = optional(bool)
            tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = optional(bool)
            tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = optional(bool)
            tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = optional(bool)
            tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = optional(bool)
            tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = optional(bool)
            tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = optional(bool)
            tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = optional(bool)
            tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = optional(bool)
            tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = optional(bool)
            triple_des_ciphers_enabled                          = optional(bool)
        })))
    sign_in                       = optional(list(object({
            enabled = bool
        })))
    sign_up                       = optional(list(object({
            enabled          = bool
            terms_of_service = list(object({
                consent_required = bool
                enabled          = bool
                text             = optional(string)
            }))
        })))
    tenant_access                 = optional(list(object({
            enabled = bool
        })))
    virtual_network_configuration = optional(list(object({
            subnet_id = string
        })))
  }))
}
