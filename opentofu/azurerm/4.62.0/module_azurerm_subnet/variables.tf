variable "subnets" {
  description = <<EOT
Map of subnets, attributes below
Required:
    - name
    - resource_group_name
    - virtual_network_name
Optional:
    - address_prefixes
    - default_outbound_access_enabled
    - private_endpoint_network_policies
    - private_link_service_network_policies_enabled
    - service_endpoint_policy_ids
    - service_endpoints
    - sharing_scope
    - delegation
    - ip_address_pool
EOT

  type = map(object({
    name                                          = string
    resource_group_name                           = string
    virtual_network_name                          = string
    address_prefixes                              = optional(list(string))
    default_outbound_access_enabled               = optional(bool)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoint_policy_ids                   = optional(set(string))
    service_endpoints                             = optional(set(string))
    sharing_scope                                 = optional(string)
    delegation                                    = optional(list(object({
            name               = string
            service_delegation = list(object({
                name    = string
                actions = optional(set(string))
            }))
        })))
    ip_address_pool                               = optional(list(object({
            number_of_ip_addresses = string
        })))
  }))
}
