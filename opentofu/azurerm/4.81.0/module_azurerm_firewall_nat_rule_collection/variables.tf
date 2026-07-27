variable "firewall_nat_rule_collections" {
  description = <<EOT
Map of firewall_nat_rule_collections, attributes below
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
            destination_addresses = list(string)
            destination_ports     = list(string)
            name                  = string
            protocols             = list(string)
            translated_address    = string
            translated_port       = string
            description           = optional(string)
            source_addresses      = optional(list(string))
            source_ip_groups      = optional(list(string))
        }))
  }))
}
