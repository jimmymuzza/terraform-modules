variable "app_configurations" {
  description = <<EOT
Map of app_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - data_plane_proxy_authentication_mode
    - data_plane_proxy_private_link_delegation_enabled
    - local_auth_enabled
    - public_network_access
    - purge_protection_enabled
    - sku
    - soft_delete_retention_days
    - tags
    - encryption
    - identity
    - replica
EOT

  type = map(object({
    location                                         = string
    name                                             = string
    resource_group_name                              = string
    data_plane_proxy_authentication_mode             = optional(string)
    data_plane_proxy_private_link_delegation_enabled = optional(bool)
    local_auth_enabled                               = optional(bool)
    public_network_access                            = optional(string)
    purge_protection_enabled                         = optional(bool)
    sku                                              = optional(string)
    soft_delete_retention_days                       = optional(number)
    tags                                             = optional(map(string))
    encryption                                       = optional(list(object({
            identity_client_id       = optional(string)
            key_vault_key_identifier = optional(string)
        })))
    identity                                         = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    replica                                          = optional(set(object({
            location = string
            name     = string
        })))
  }))
}
