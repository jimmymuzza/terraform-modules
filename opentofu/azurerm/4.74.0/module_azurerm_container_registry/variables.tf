variable "container_registries" {
  description = <<EOT
Map of container_registries, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - admin_enabled
    - anonymous_pull_enabled
    - data_endpoint_enabled
    - encryption
    - export_policy_enabled
    - network_rule_bypass_option
    - network_rule_set
    - public_network_access_enabled
    - quarantine_policy_enabled
    - retention_policy_in_days
    - tags
    - trust_policy_enabled
    - zone_redundancy_enabled
    - georeplications
    - identity
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    admin_enabled                 = optional(bool)
    anonymous_pull_enabled        = optional(bool)
    data_endpoint_enabled         = optional(bool)
    encryption                    = optional(list(object({
            identity_client_id = string
            key_vault_key_id = string
        })))
    export_policy_enabled         = optional(bool)
    network_rule_bypass_option    = optional(string)
    network_rule_set              = optional(list(object({
            default_action = string
            ip_rule = set(object({
                action = string
                ip_range = string
            }))
        })))
    public_network_access_enabled = optional(bool)
    quarantine_policy_enabled     = optional(bool)
    retention_policy_in_days      = optional(number)
    tags                          = optional(map(string))
    trust_policy_enabled          = optional(bool)
    zone_redundancy_enabled       = optional(bool)
    georeplications               = optional(list(object({
            location                  = string
            regional_endpoint_enabled = optional(bool)
            tags                      = optional(map(string))
            zone_redundancy_enabled   = optional(bool)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
