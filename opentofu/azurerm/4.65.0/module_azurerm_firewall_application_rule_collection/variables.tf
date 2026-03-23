variable "firewall_application_rule_collections" {
  description = <<EOT
Map of firewall_application_rule_collections, attributes below
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
            name             = string
            description      = optional(string)
            fqdn_tags        = optional(list(string))
            source_addresses = optional(list(string))
            source_ip_groups = optional(list(string))
            target_fqdns     = optional(list(string))
            protocol         = optional(list(object({
                port = number
                type = string
            })))
        }))
  }))
}
