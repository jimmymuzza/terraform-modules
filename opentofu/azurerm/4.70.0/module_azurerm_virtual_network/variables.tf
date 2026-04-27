variable "virtual_networks" {
  description = <<EOT
Map of virtual_networks, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - address_space
    - bgp_community
    - dns_servers
    - edge_zone
    - flow_timeout_in_minutes
    - private_endpoint_vnet_policies
    - subnet
    - tags
    - ddos_protection_plan
    - encryption
    - ip_address_pool
EOT

  type = map(object({
    location                       = string
    name                           = string
    resource_group_name            = string
    address_space                  = optional(set(string))
    bgp_community                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)
    subnet                         = optional(set(object({
            address_prefixes = list(string)
            default_outbound_access_enabled = bool
            delegation = list(object({
                name = string
                service_delegation = list(object({
                    actions = set(string)
                    name = string
                }))
            }))
            id = string
            name = string
            private_endpoint_network_policies = string
            private_link_service_network_policies_enabled = bool
            route_table_id = string
            security_group = string
            service_endpoint_policy_ids = set(string)
            service_endpoints = set(string)
        })))
    tags                           = optional(map(string))
    ddos_protection_plan           = optional(list(object({
            enable = bool
        })))
    encryption                     = optional(list(object({
            enforcement = string
        })))
    ip_address_pool                = optional(list(object({
            number_of_ip_addresses = string
        })))
  }))
}
