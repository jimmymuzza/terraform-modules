variable "lb_nat_pools" {
  description = <<EOT
Map of lb_nat_pools, attributes below
Required:
    - backend_port
    - frontend_ip_configuration_name
    - frontend_port_end
    - frontend_port_start
    - loadbalancer_id
    - name
    - protocol
    - resource_group_name
Optional:
    - floating_ip_enabled
    - idle_timeout_in_minutes
    - tcp_reset_enabled
EOT

  type = map(object({
    backend_port                   = number
    frontend_ip_configuration_name = string
    frontend_port_end              = number
    frontend_port_start            = number
    loadbalancer_id                = string
    name                           = string
    protocol                       = string
    resource_group_name            = string
    floating_ip_enabled            = optional(bool)
    idle_timeout_in_minutes        = optional(number)
    tcp_reset_enabled              = optional(bool)
  }))
}
