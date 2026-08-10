variable "express_route_connections" {
  description = <<EOT
Map of express_route_connections, attributes below
Required:
    - express_route_circuit_peering_id
    - express_route_gateway_id
    - name
Optional:
    - authorization_key
    - express_route_gateway_bypass_enabled
    - internet_security_enabled
    - routing_weight
    - routing
EOT

  type = map(object({
    express_route_circuit_peering_id     = string
    express_route_gateway_id             = string
    name                                 = string
    authorization_key                    = optional(string)
    express_route_gateway_bypass_enabled = optional(bool)
    internet_security_enabled            = optional(bool)
    routing_weight                       = optional(number)
    routing                              = optional(list(object({
            associated_route_table_id = optional(string)
            inbound_route_map_id      = optional(string)
            outbound_route_map_id     = optional(string)
            propagated_route_table    = optional(list(object({
                labels          = optional(set(string))
                route_table_ids = optional(list(string))
            })))
        })))
  }))
}
