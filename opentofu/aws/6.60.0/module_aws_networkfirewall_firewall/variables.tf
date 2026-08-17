variable "networkfirewall_firewalls" {
  description = <<EOT
Map of networkfirewall_firewalls, attributes below
Required:
    - firewall_policy_arn
    - name
Optional:
    - availability_zone_change_protection
    - delete_protection
    - description
    - enabled_analysis_types
    - firewall_policy_change_protection
    - region
    - subnet_change_protection
    - tags
    - tags_all
    - transit_gateway_id
    - vpc_id
    - availability_zone_mapping
    - encryption_configuration
    - subnet_mapping
EOT

  type = map(object({
    firewall_policy_arn                 = string
    name                                = string
    availability_zone_change_protection = optional(bool)
    delete_protection                   = optional(bool)
    description                         = optional(string)
    enabled_analysis_types              = optional(set(string))
    firewall_policy_change_protection   = optional(bool)
    region                              = optional(string)
    subnet_change_protection            = optional(bool)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    transit_gateway_id                  = optional(string)
    vpc_id                              = optional(string)
    availability_zone_mapping           = optional(set(object({
            availability_zone_id = string
        })))
    encryption_configuration            = optional(list(object({
            type   = string
            key_id = optional(string)
        })))
    subnet_mapping                      = optional(set(object({
            subnet_id       = string
            ip_address_type = optional(string)
        })))
  }))
}
