variable "network_security_groups" {
  description = <<EOT
Map of network_security_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - security_rule
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    security_rule       = optional(set(object({
            access = string
            description = string
            destination_address_prefix = string
            destination_address_prefixes = set(string)
            destination_application_security_group_ids = set(string)
            destination_port_range = string
            destination_port_ranges = set(string)
            direction = string
            name = string
            priority = number
            protocol = string
            source_address_prefix = string
            source_address_prefixes = set(string)
            source_application_security_group_ids = set(string)
            source_port_range = string
            source_port_ranges = set(string)
        })))
    tags                = optional(map(string))
  }))
}
