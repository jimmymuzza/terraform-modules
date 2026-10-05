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
    - network_security_group_id_wo
    - network_security_group_id_wo_version
    - private_endpoint_network_policies
    - private_link_service_network_policies_enabled
    - route_table_id_wo
    - route_table_id_wo_version
    - service_endpoint_policy_ids
    - sharing_scope
    - delegation
    - ip_address_pool
    - service_endpoint
EOT

  type = map(object({
    name                                          = string
    resource_group_name                           = string
    virtual_network_name                          = string
    address_prefixes                              = optional(list(string))
    default_outbound_access_enabled               = optional(bool)
    network_security_group_id_wo                  = optional(string)
    network_security_group_id_wo_version          = optional(number)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    route_table_id_wo                             = optional(string)
    route_table_id_wo_version                     = optional(number)
    service_endpoint_policy_ids                   = optional(set(string))
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
    service_endpoint                              = optional(list(object({
            service            = string
            network_identifier = optional(string)
        })))
  }))
}
