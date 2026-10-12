variable "private_endpoints" {
  description = <<EOT
Map of private_endpoints, attributes below
Required:
    - location
    - name
    - resource_group_name
    - subnet_id
    - private_service_connection
Optional:
    - custom_network_interface_name
    - edge_zone
    - tags
    - ip_configuration
    - private_dns_zone_group
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    subnet_id                     = string
    custom_network_interface_name = optional(string)
    edge_zone                     = optional(string)
    tags                          = optional(map(string))
    ip_configuration              = optional(list(object({
            name               = string
            private_ip_address = string
            member_name        = optional(string)
            subresource_name   = optional(string)
        })))
    private_dns_zone_group        = optional(list(object({
            name                 = string
            private_dns_zone_ids = list(string)
        })))
    private_service_connection    = list(object({
            is_manual_connection              = bool
            name                              = string
            private_connection_resource_alias = optional(string)
            private_connection_resource_id    = optional(string)
            request_message                   = optional(string)
            subresource_names                 = optional(list(string))
        }))
  }))
}
