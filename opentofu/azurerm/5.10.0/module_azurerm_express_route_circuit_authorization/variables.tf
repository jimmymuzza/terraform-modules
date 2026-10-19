variable "express_route_circuit_authorizations" {
  description = <<EOT
Map of express_route_circuit_authorizations, attributes below
Required:
    - express_route_circuit_name
    - name
    - resource_group_name
EOT

  type = map(object({
    express_route_circuit_name = string
    name                       = string
    resource_group_name        = string
  }))
}
