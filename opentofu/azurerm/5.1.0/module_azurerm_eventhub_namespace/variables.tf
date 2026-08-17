variable "eventhub_namespaces" {
  description = <<EOT
Map of eventhub_namespaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - auto_inflate_enabled
    - capacity
    - dedicated_cluster_id
    - local_authentication_enabled
    - maximum_throughput_units
    - minimum_tls_version
    - network_rulesets
    - public_network_access_enabled
    - tags
    - identity
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    auto_inflate_enabled          = optional(bool)
    capacity                      = optional(number)
    dedicated_cluster_id          = optional(string)
    local_authentication_enabled  = optional(bool)
    maximum_throughput_units      = optional(number)
    minimum_tls_version           = optional(string)
    network_rulesets              = optional(list(object({
            default_action = string
            ip_rule = list(object({
                action = string
                ip_mask = string
            }))
            public_network_access_enabled = bool
            trusted_service_access_enabled = bool
            virtual_network_rule = set(object({
                ignore_missing_virtual_network_service_endpoint = bool
                subnet_id = string
            }))
        })))
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
