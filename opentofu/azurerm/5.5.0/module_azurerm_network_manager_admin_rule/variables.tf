variable "network_manager_admin_rules" {
  description = <<EOT
Map of network_manager_admin_rules, attributes below
Required:
    - action
    - admin_rule_collection_id
    - direction
    - name
    - priority
    - protocol
Optional:
    - description
    - destination_port_ranges
    - source_port_ranges
    - destination
    - source
EOT

  type = map(object({
    action                   = string
    admin_rule_collection_id = string
    direction                = string
    name                     = string
    priority                 = number
    protocol                 = string
    description              = optional(string)
    destination_port_ranges  = optional(list(string))
    source_port_ranges       = optional(list(string))
    destination              = optional(list(object({
            address_prefix      = string
            address_prefix_type = string
        })))
    source                   = optional(list(object({
            address_prefix      = string
            address_prefix_type = string
        })))
  }))
}
