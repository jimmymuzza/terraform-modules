variable "firewall_network_rule_collections" {
  description = <<EOT
Map of firewall_network_rule_collections, attributes below
Required:
    - action
    - azure_firewall_name
    - name
    - priority
    - resource_group_name
    - rule
EOT

  type = map(object({
    action              = string
    azure_firewall_name = string
    name                = string
    priority            = number
    resource_group_name = string
    rule                = list(object({
            destination_ports     = list(string)
            name                  = string
            protocols             = list(string)
            description           = optional(string)
            destination_addresses = optional(list(string))
            destination_fqdns     = optional(list(string))
            destination_ip_groups = optional(list(string))
            source_addresses      = optional(list(string))
            source_ip_groups      = optional(list(string))
        }))
  }))
}
