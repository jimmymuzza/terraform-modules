variable "servicebus_namespaces" {
  description = <<EOT
Map of servicebus_namespaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - capacity
    - local_auth_enabled
    - minimum_tls_version
    - premium_messaging_partitions
    - public_network_access_enabled
    - tags
    - customer_managed_key
    - identity
    - network_rule_set
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    capacity                      = optional(number)
    local_auth_enabled            = optional(bool)
    minimum_tls_version           = optional(string)
    premium_messaging_partitions  = optional(number)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    customer_managed_key          = optional(list(object({
            identity_id                       = string
            key_vault_key_id                  = string
            infrastructure_encryption_enabled = optional(bool)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_rule_set              = optional(list(object({
            default_action                = optional(string)
            ip_rules                      = optional(set(string))
            public_network_access_enabled = optional(bool)
            trusted_services_allowed      = optional(bool)
            network_rules                 = optional(set(object({
                subnet_id                            = string
                ignore_missing_vnet_service_endpoint = optional(bool)
            })))
        })))
  }))
}
