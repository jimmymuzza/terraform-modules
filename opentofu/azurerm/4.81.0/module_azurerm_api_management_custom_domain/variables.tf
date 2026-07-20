variable "api_management_custom_domains" {
  description = <<EOT
Map of api_management_custom_domains, attributes below
Required:
    - api_management_id
Optional:
    - developer_portal
    - gateway
    - management
    - portal
    - scm
EOT

  type = map(object({
    api_management_id = string
    developer_portal  = optional(list(object({
            host_name                       = string
            certificate                     = optional(string)
            certificate_password            = optional(string)
            key_vault_certificate_id        = optional(string)
            key_vault_id                    = optional(string)
            negotiate_client_certificate    = optional(bool)
            ssl_keyvault_identity_client_id = optional(string)
        })))
    gateway           = optional(list(object({
            host_name                       = string
            certificate                     = optional(string)
            certificate_password            = optional(string)
            default_ssl_binding             = optional(bool)
            key_vault_certificate_id        = optional(string)
            key_vault_id                    = optional(string)
            negotiate_client_certificate    = optional(bool)
            ssl_keyvault_identity_client_id = optional(string)
        })))
    management        = optional(list(object({
            host_name                       = string
            certificate                     = optional(string)
            certificate_password            = optional(string)
            key_vault_certificate_id        = optional(string)
            key_vault_id                    = optional(string)
            negotiate_client_certificate    = optional(bool)
            ssl_keyvault_identity_client_id = optional(string)
        })))
    portal            = optional(list(object({
            host_name                       = string
            certificate                     = optional(string)
            certificate_password            = optional(string)
            key_vault_certificate_id        = optional(string)
            key_vault_id                    = optional(string)
            negotiate_client_certificate    = optional(bool)
            ssl_keyvault_identity_client_id = optional(string)
        })))
    scm               = optional(list(object({
            host_name                       = string
            certificate                     = optional(string)
            certificate_password            = optional(string)
            key_vault_certificate_id        = optional(string)
            key_vault_id                    = optional(string)
            negotiate_client_certificate    = optional(bool)
            ssl_keyvault_identity_client_id = optional(string)
        })))
  }))
}
