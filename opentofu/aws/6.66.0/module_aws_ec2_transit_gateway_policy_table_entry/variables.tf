variable "ec2_transit_gateway_policy_table_entries" {
  description = <<EOT
Map of ec2_transit_gateway_policy_table_entries, attributes below
Required:
    - policy_rule_number
    - target_route_table_id
    - transit_gateway_policy_table_id
Optional:
    - region
    - policy_rule
EOT

  type = map(object({
    policy_rule_number              = string
    target_route_table_id           = string
    transit_gateway_policy_table_id = string
    region                          = optional(string)
    policy_rule                     = optional(list(object({
            destination_cidr_block = optional(string)
            destination_port_range = optional(string)
            protocol               = optional(string)
            source_cidr_block      = optional(string)
            source_port_range      = optional(string)
            metadata               = optional(list(object({
                key   = optional(string)
                value = optional(string)
            })))
        })))
  }))
}
