variable "network_manager_routing_configurations" {
  description = <<EOT
Map of network_manager_routing_configurations, attributes below
Required:
    - name
    - network_manager_id
Optional:
    - description
    - route_table_usage_mode
EOT

  type = map(object({
    name                   = string
    network_manager_id     = string
    description            = optional(string)
    route_table_usage_mode = optional(string)
  }))
}
