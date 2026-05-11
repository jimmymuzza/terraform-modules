variable "lbs" {
  description = <<EOT
Map of lbs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - edge_zone
    - public_ip_address_id
    - sku
    - sku_tier
    - subnet_id
    - tags
    - frontend_ip_configuration
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    edge_zone                 = optional(string)
    public_ip_address_id      = optional(string)
    sku                       = optional(string)
    sku_tier                  = optional(string)
    subnet_id                 = optional(string)
    tags                      = optional(map(string))
    frontend_ip_configuration = optional(list(object({
            name                                               = string
            gateway_load_balancer_frontend_ip_configuration_id = optional(string)
            private_ip_address                                 = optional(string)
            private_ip_address_allocation                      = optional(string)
            private_ip_address_version                         = optional(string)
            public_ip_address_id                               = optional(string)
            public_ip_prefix_id                                = optional(string)
            subnet_id                                          = optional(string)
            zones                                              = optional(set(string))
        })))
  }))
}
