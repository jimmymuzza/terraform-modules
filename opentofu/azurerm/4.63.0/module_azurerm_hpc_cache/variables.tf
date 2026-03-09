variable "hpc_caches" {
  description = <<EOT
Map of hpc_caches, attributes below
Required:
    - cache_size_in_gb
    - location
    - name
    - resource_group_name
    - sku_name
    - subnet_id
Optional:
    - automatically_rotate_key_to_latest_enabled
    - key_vault_key_id
    - mtu
    - ntp_server
    - tags
    - default_access_policy
    - directory_active_directory
    - directory_flat_file
    - directory_ldap
    - dns
    - identity
EOT

  type = map(object({
    cache_size_in_gb                           = number
    location                                   = string
    name                                       = string
    resource_group_name                        = string
    sku_name                                   = string
    subnet_id                                  = string
    automatically_rotate_key_to_latest_enabled = optional(bool)
    key_vault_key_id                           = optional(string)
    mtu                                        = optional(number)
    ntp_server                                 = optional(string)
    tags                                       = optional(map(string))
    default_access_policy                      = optional(list(object({
            access_rule = set(object({
                access                  = string
                scope                   = string
                anonymous_gid           = optional(number)
                anonymous_uid           = optional(number)
                filter                  = optional(string)
                root_squash_enabled     = optional(bool)
                submount_access_enabled = optional(bool)
                suid_enabled            = optional(bool)
            }))
        })))
    directory_active_directory                 = optional(list(object({
            cache_netbios_name  = string
            dns_primary_ip      = string
            domain_name         = string
            domain_netbios_name = string
            password            = string
            username            = string
            dns_secondary_ip    = optional(string)
        })))
    directory_flat_file                        = optional(list(object({
            group_file_uri    = string
            password_file_uri = string
        })))
    directory_ldap                             = optional(list(object({
            base_dn                            = string
            server                             = string
            certificate_validation_uri         = optional(string)
            download_certificate_automatically = optional(bool)
            encrypted                          = optional(bool)
            bind                               = optional(list(object({
                dn       = string
                password = string
            })))
        })))
    dns                                        = optional(list(object({
            servers       = list(string)
            search_domain = optional(string)
        })))
    identity                                   = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
