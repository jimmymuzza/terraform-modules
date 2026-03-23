variable "ai_services" {
  description = <<EOT
Map of ai_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - custom_subdomain_name
    - fqdns
    - local_authentication_enabled
    - outbound_network_access_restricted
    - public_network_access
    - tags
    - customer_managed_key
    - identity
    - network_acls
    - storage
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    sku_name                           = string
    custom_subdomain_name              = optional(string)
    fqdns                              = optional(list(string))
    local_authentication_enabled       = optional(bool)
    outbound_network_access_restricted = optional(bool)
    public_network_access              = optional(string)
    tags                               = optional(map(string))
    customer_managed_key               = optional(list(object({
            identity_client_id = optional(string)
            key_vault_key_id   = optional(string)
            managed_hsm_key_id = optional(string)
        })))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_acls                       = optional(list(object({
            default_action        = string
            bypass                = optional(string)
            ip_rules              = optional(set(string))
            virtual_network_rules = optional(set(object({
                subnet_id                            = string
                ignore_missing_vnet_service_endpoint = optional(bool)
            })))
        })))
    storage                            = optional(list(object({
            storage_account_id = string
            identity_client_id = optional(string)
        })))
  }))
}
