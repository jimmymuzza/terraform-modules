variable "lb_outbound_rules" {
  description = <<EOT
Map of lb_outbound_rules, attributes below
Required:
    - backend_address_pool_id
    - loadbalancer_id
    - name
    - protocol
Optional:
    - allocated_outbound_ports
    - idle_timeout_in_minutes
    - tcp_reset_enabled
    - frontend_ip_configuration
EOT

  type = map(object({
    backend_address_pool_id   = string
    loadbalancer_id           = string
    name                      = string
    protocol                  = string
    allocated_outbound_ports  = optional(number)
    idle_timeout_in_minutes   = optional(number)
    tcp_reset_enabled         = optional(bool)
    frontend_ip_configuration = optional(list(object({
            name = string
        })))
  }))
}
