variable "lb_nat_rules" {
  description = <<EOT
Map of lb_nat_rules, attributes below
Required:
    - backend_port
    - frontend_ip_configuration_name
    - loadbalancer_id
    - name
    - protocol
    - resource_group_name
Optional:
    - backend_address_pool_id
    - enable_floating_ip
    - enable_tcp_reset
    - floating_ip_enabled
    - frontend_port
    - frontend_port_end
    - frontend_port_start
    - idle_timeout_in_minutes
    - tcp_reset_enabled
EOT

  type = map(object({
    backend_port                   = number
    frontend_ip_configuration_name = string
    loadbalancer_id                = string
    name                           = string
    protocol                       = string
    resource_group_name            = string
    backend_address_pool_id        = optional(string)
    enable_floating_ip             = optional(bool)
    enable_tcp_reset               = optional(bool)
    floating_ip_enabled            = optional(bool)
    frontend_port                  = optional(number)
    frontend_port_end              = optional(number)
    frontend_port_start            = optional(number)
    idle_timeout_in_minutes        = optional(number)
    tcp_reset_enabled              = optional(bool)
  }))
}
