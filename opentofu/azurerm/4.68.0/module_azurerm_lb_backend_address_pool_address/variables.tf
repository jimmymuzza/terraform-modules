variable "lb_backend_address_pool_addresses" {
  description = <<EOT
Map of lb_backend_address_pool_addresses, attributes below
Required:
    - backend_address_pool_id
    - name
Optional:
    - backend_address_ip_configuration_id
    - ip_address
    - virtual_network_id
EOT

  type = map(object({
    backend_address_pool_id             = string
    name                                = string
    backend_address_ip_configuration_id = optional(string)
    ip_address                          = optional(string)
    virtual_network_id                  = optional(string)
  }))
}
