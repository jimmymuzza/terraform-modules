variable "batch_accounts" {
  description = <<EOT
Map of batch_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - allowed_authentication_modes
    - encryption
    - pool_allocation_mode
    - public_network_access_enabled
    - storage_account_authentication_mode
    - storage_account_id
    - storage_account_node_identity
    - tags
    - identity
    - key_vault_reference
    - network_profile
EOT

  type = map(object({
    location                            = string
    name                                = string
    resource_group_name                 = string
    allowed_authentication_modes        = optional(set(string))
    encryption                          = optional(list(object({
            key_vault_key_id = string
        })))
    pool_allocation_mode                = optional(string)
    public_network_access_enabled       = optional(bool)
    storage_account_authentication_mode = optional(string)
    storage_account_id                  = optional(string)
    storage_account_node_identity       = optional(string)
    tags                                = optional(map(string))
    identity                            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    key_vault_reference                 = optional(list(object({
            url = string
        })))
    network_profile                     = optional(list(object({
            account_access         = optional(list(object({
                default_action = optional(string)
                ip_rule        = optional(list(object({
                    ip_range = string
                    action   = optional(string)
                })))
            })))
            node_management_access = optional(list(object({
                default_action = optional(string)
                ip_rule        = optional(list(object({
                    ip_range = string
                    action   = optional(string)
                })))
            })))
        })))
  }))
}
