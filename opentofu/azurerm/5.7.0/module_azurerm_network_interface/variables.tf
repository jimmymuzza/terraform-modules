variable "network_interfaces" {
  description = <<EOT
Map of network_interfaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - ip_configuration
Optional:
    - accelerated_networking_enabled
    - auxiliary_mode
    - auxiliary_sku
    - dns_servers
    - edge_zone
    - internal_dns_name_label
    - ip_forwarding_enabled
    - tags
EOT

  type = map(object({
    location                       = string
    name                           = string
    resource_group_name            = string
    accelerated_networking_enabled = optional(bool)
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    internal_dns_name_label        = optional(string)
    ip_forwarding_enabled          = optional(bool)
    tags                           = optional(map(string))
    ip_configuration               = list(object({
            name                                               = string
            private_ip_address_allocation                      = string
            gateway_load_balancer_frontend_ip_configuration_id = optional(string)
            primary                                            = optional(bool)
            private_ip_address                                 = optional(string)
            private_ip_address_version                         = optional(string)
            public_ip_address_id                               = optional(string)
            subnet_id                                          = optional(string)
        }))
  }))
}
