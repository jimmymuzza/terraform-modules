variable "active_directory_domain_services" {
  description = <<EOT
Map of active_directory_domain_services, attributes below
Required:
    - domain_name
    - location
    - name
    - resource_group_name
    - sku
    - initial_replica_set
Optional:
    - domain_configuration_type
    - filtered_sync_enabled
    - tags
    - notifications
    - secure_ldap
    - security
EOT

  type = map(object({
    domain_name               = string
    location                  = string
    name                      = string
    resource_group_name       = string
    sku                       = string
    domain_configuration_type = optional(string)
    filtered_sync_enabled     = optional(bool)
    tags                      = optional(map(string))
    initial_replica_set       = list(object({
            subnet_id = string
        }))
    notifications             = optional(list(object({
            additional_recipients = optional(set(string))
            notify_dc_admins      = optional(bool)
            notify_global_admins  = optional(bool)
        })))
    secure_ldap               = optional(list(object({
            enabled                  = bool
            pfx_certificate          = string
            pfx_certificate_password = string
            external_access_enabled  = optional(bool)
        })))
    security                  = optional(list(object({
            kerberos_armoring_enabled       = optional(bool)
            kerberos_rc4_encryption_enabled = optional(bool)
            ntlm_v1_enabled                 = optional(bool)
            sync_kerberos_passwords         = optional(bool)
            sync_ntlm_passwords             = optional(bool)
            sync_on_prem_passwords          = optional(bool)
            tls_v1_enabled                  = optional(bool)
        })))
  }))
}
