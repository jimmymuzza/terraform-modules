variable "firewall_policy_rule_collection_groups" {
  description = <<EOT
Map of firewall_policy_rule_collection_groups, attributes below
Required:
    - firewall_policy_id
    - name
    - priority
Optional:
    - application_rule_collection
    - nat_rule_collection
    - network_rule_collection
EOT

  type = map(object({
    firewall_policy_id          = string
    name                        = string
    priority                    = number
    application_rule_collection = optional(list(object({
            action   = string
            name     = string
            priority = number
            rule     = list(object({
                name                  = string
                description           = optional(string)
                destination_addresses = optional(list(string))
                destination_fqdn_tags = optional(list(string))
                destination_fqdns     = optional(list(string))
                destination_urls      = optional(list(string))
                source_addresses      = optional(list(string))
                source_ip_groups      = optional(list(string))
                terminate_tls         = optional(bool)
                web_categories        = optional(list(string))
                http_headers          = optional(list(object({
                    name  = string
                    value = string
                })))
                protocols             = optional(list(object({
                    port = number
                    type = string
                })))
            }))
        })))
    nat_rule_collection         = optional(list(object({
            action   = string
            name     = string
            priority = number
            rule     = list(object({
                name                = string
                protocols           = list(string)
                translated_port     = number
                description         = optional(string)
                destination_address = optional(string)
                destination_ports   = optional(list(string))
                source_addresses    = optional(list(string))
                source_ip_groups    = optional(list(string))
                translated_address  = optional(string)
                translated_fqdn     = optional(string)
            }))
        })))
    network_rule_collection     = optional(list(object({
            action   = string
            name     = string
            priority = number
            rule     = list(object({
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
        })))
  }))
}
