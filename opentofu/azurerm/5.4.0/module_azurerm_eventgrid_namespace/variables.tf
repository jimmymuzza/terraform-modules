variable "eventgrid_namespaces" {
  description = <<EOT
Map of eventgrid_namespaces, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - capacity
    - public_network_access
    - sku
    - tags
    - identity
    - inbound_ip_rule
    - topic_spaces_configuration
EOT

  type = map(object({
    location                   = string
    name                       = string
    resource_group_name        = string
    capacity                   = optional(number)
    public_network_access      = optional(string)
    sku                        = optional(string)
    tags                       = optional(map(string))
    identity                   = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    inbound_ip_rule            = optional(list(object({
            ip_mask = string
            action  = optional(string)
        })))
    topic_spaces_configuration = optional(list(object({
            alternative_authentication_name_source          = optional(list(string))
            maximum_client_sessions_per_authentication_name = optional(number)
            maximum_session_expiry_in_hours                 = optional(number)
            route_topic_id                                  = optional(string)
            dynamic_routing_enrichment                      = optional(list(object({
                key   = string
                value = string
            })))
            static_routing_enrichment                       = optional(list(object({
                key   = string
                value = string
            })))
        })))
  }))
}
