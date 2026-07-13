variable "lb_backend_address_pools" {
  description = <<EOT
Map of lb_backend_address_pools, attributes below
Required:
    - loadbalancer_id
    - name
Optional:
    - synchronous_mode
    - virtual_network_id
    - tunnel_interface
EOT

  type = map(object({
    loadbalancer_id    = string
    name               = string
    synchronous_mode   = optional(string)
    virtual_network_id = optional(string)
    tunnel_interface   = optional(list(object({
            identifier = number
            port       = number
            protocol   = string
            type       = string
        })))
  }))
}
