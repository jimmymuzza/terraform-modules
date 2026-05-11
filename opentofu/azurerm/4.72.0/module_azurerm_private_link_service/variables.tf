variable "private_link_services" {
  description = <<EOT
Map of private_link_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - nat_ip_configuration
Optional:
    - auto_approval_subscription_ids
    - destination_ip_address
    - enable_proxy_protocol
    - fqdns
    - load_balancer_frontend_ip_configuration_ids
    - proxy_protocol_enabled
    - tags
    - visibility_subscription_ids
EOT

  type = map(object({
    location                                    = string
    name                                        = string
    resource_group_name                         = string
    auto_approval_subscription_ids              = optional(set(string))
    destination_ip_address                      = optional(string)
    enable_proxy_protocol                       = optional(bool)
    fqdns                                       = optional(list(string))
    load_balancer_frontend_ip_configuration_ids = optional(set(string))
    proxy_protocol_enabled                      = optional(bool)
    tags                                        = optional(map(string))
    visibility_subscription_ids                 = optional(set(string))
    nat_ip_configuration                        = list(object({
            name                       = string
            primary                    = bool
            subnet_id                  = string
            private_ip_address         = optional(string)
            private_ip_address_version = optional(string)
        }))
  }))
}
