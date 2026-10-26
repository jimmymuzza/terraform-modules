variable "ec2_transit_gateway_metering_policy_entries" {
  description = <<EOT
Map of ec2_transit_gateway_metering_policy_entries, attributes below
Required:
    - metered_account
    - policy_rule_number
    - transit_gateway_metering_policy_id
Optional:
    - destination_cidr_block
    - destination_port_range
    - destination_transit_gateway_attachment_id
    - destination_transit_gateway_attachment_type
    - protocol
    - region
    - source_cidr_block
    - source_port_range
    - source_transit_gateway_attachment_id
    - source_transit_gateway_attachment_type
EOT

  type = map(object({
    metered_account                             = string
    policy_rule_number                          = number
    transit_gateway_metering_policy_id          = string
    destination_cidr_block                      = optional(string)
    destination_port_range                      = optional(string)
    destination_transit_gateway_attachment_id   = optional(string)
    destination_transit_gateway_attachment_type = optional(string)
    protocol                                    = optional(string)
    region                                      = optional(string)
    source_cidr_block                           = optional(string)
    source_port_range                           = optional(string)
    source_transit_gateway_attachment_id        = optional(string)
    source_transit_gateway_attachment_type      = optional(string)
  }))
}
