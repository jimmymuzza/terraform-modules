variable "network_security_perimeter_access_rules" {
  description = <<EOT
Map of network_security_perimeter_access_rules, attributes below
Required:
    - direction
    - name
    - network_security_perimeter_profile_id
Optional:
    - address_prefixes
    - fqdns
    - service_tags
    - subscription_ids
EOT

  type = map(object({
    direction                             = string
    name                                  = string
    network_security_perimeter_profile_id = string
    address_prefixes                      = optional(list(string))
    fqdns                                 = optional(list(string))
    service_tags                          = optional(list(string))
    subscription_ids                      = optional(list(string))
  }))
}
