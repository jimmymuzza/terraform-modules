variable "network_manager_routing_rule_collections" {
  description = <<EOT
Map of network_manager_routing_rule_collections, attributes below
Required:
    - name
    - network_group_ids
    - routing_configuration_id
Optional:
    - bgp_route_propagation_enabled
    - description
EOT

  type = map(object({
    name                          = string
    network_group_ids             = list(string)
    routing_configuration_id      = string
    bgp_route_propagation_enabled = optional(bool)
    description                   = optional(string)
  }))
}
