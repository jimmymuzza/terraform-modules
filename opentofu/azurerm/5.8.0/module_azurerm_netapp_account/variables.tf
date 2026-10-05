variable "netapp_accounts" {
  description = <<EOT
Map of netapp_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - active_directory
    - identity
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    active_directory    = optional(list(object({
            dns_servers                       = list(string)
            domain                            = string
            password                          = string
            smb_server_name                   = string
            username                          = string
            aes_encryption_enabled            = optional(bool)
            kerberos_ad_name                  = optional(string)
            kerberos_kdc_ip                   = optional(string)
            ldap_over_tls_enabled             = optional(bool)
            ldap_signing_enabled              = optional(bool)
            local_nfs_users_with_ldap_allowed = optional(bool)
            organizational_unit               = optional(string)
            server_root_ca_certificate        = optional(string)
            site_name                         = optional(string)
        })))
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
