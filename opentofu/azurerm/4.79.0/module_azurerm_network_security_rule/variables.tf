variable "network_security_rules" {
  description = <<EOT
Map of network_security_rules, attributes below
Required:
    - access
    - direction
    - name
    - network_security_group_name
    - priority
    - protocol
    - resource_group_name
Optional:
    - description
    - destination_address_prefix
    - destination_address_prefixes
    - destination_application_security_group_ids
    - destination_port_range
    - destination_port_ranges
    - source_address_prefix
    - source_address_prefixes
    - source_application_security_group_ids
    - source_port_range
    - source_port_ranges
EOT

  type = map(object({
    access                                     = string
    direction                                  = string
    name                                       = string
    network_security_group_name                = string
    priority                                   = number
    protocol                                   = string
    resource_group_name                        = string
    description                                = optional(string)
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(set(string))
    destination_application_security_group_ids = optional(set(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(set(string))
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(set(string))
    source_application_security_group_ids      = optional(set(string))
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(set(string))
  }))
}
