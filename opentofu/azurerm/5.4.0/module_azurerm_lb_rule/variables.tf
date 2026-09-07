variable "lb_rules" {
  description = <<EOT
Map of lb_rules, attributes below
Required:
    - backend_port
    - frontend_ip_configuration_name
    - frontend_port
    - loadbalancer_id
    - name
    - protocol
Optional:
    - backend_address_pool_ids
    - disable_outbound_snat
    - floating_ip_enabled
    - idle_timeout_in_minutes
    - load_distribution
    - probe_id
    - tcp_reset_enabled
EOT

  type = map(object({
    backend_port                   = number
    frontend_ip_configuration_name = string
    frontend_port                  = number
    loadbalancer_id                = string
    name                           = string
    protocol                       = string
    backend_address_pool_ids       = optional(list(string))
    disable_outbound_snat          = optional(bool)
    floating_ip_enabled            = optional(bool)
    idle_timeout_in_minutes        = optional(number)
    load_distribution              = optional(string)
    probe_id                       = optional(string)
    tcp_reset_enabled              = optional(bool)
  }))
}
