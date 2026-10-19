variable "vpn_server_configurations" {
  description = <<EOT
Map of vpn_server_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - vpn_authentication_types
Optional:
    - tags
    - vpn_protocols
    - azure_active_directory_authentication
    - client_revoked_certificate
    - client_root_certificate
    - ipsec_policy
    - radius
EOT

  type = map(object({
    location                              = string
    name                                  = string
    resource_group_name                   = string
    vpn_authentication_types              = list(string)
    tags                                  = optional(map(string))
    vpn_protocols                         = optional(set(string))
    azure_active_directory_authentication = optional(list(object({
            audience = string
            issuer   = string
            tenant   = string
        })))
    client_revoked_certificate            = optional(set(object({
            name       = string
            thumbprint = string
        })))
    client_root_certificate               = optional(set(object({
            name             = string
            public_cert_data = string
        })))
    ipsec_policy                          = optional(list(object({
            dh_group               = string
            ike_encryption         = string
            ike_integrity          = string
            ipsec_encryption       = string
            ipsec_integrity        = string
            pfs_group              = string
            sa_data_size_kilobytes = number
            sa_lifetime_seconds    = number
        })))
    radius                                = optional(list(object({
            client_root_certificate = optional(set(object({
                name       = string
                thumbprint = string
            })))
            server                  = optional(list(object({
                address = string
                score   = number
                secret  = string
            })))
            server_root_certificate = optional(set(object({
                name             = string
                public_cert_data = string
            })))
        })))
  }))
}
