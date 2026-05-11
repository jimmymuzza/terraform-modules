variable "routes" {
  description = <<EOT
Map of routes, attributes below
Required:
    - address_prefix
    - name
    - next_hop_type
    - resource_group_name
    - route_table_name
Optional:
    - next_hop_in_ip_address
EOT

  type = map(object({
    address_prefix         = string
    name                   = string
    next_hop_type          = string
    resource_group_name    = string
    route_table_name       = string
    next_hop_in_ip_address = optional(string)
  }))
}
