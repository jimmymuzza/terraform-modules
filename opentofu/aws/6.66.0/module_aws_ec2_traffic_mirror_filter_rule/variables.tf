variable "ec2_traffic_mirror_filter_rules" {
  description = <<EOT
Map of ec2_traffic_mirror_filter_rules, attributes below
Required:
    - destination_cidr_block
    - rule_action
    - rule_number
    - source_cidr_block
    - traffic_direction
    - traffic_mirror_filter_id
Optional:
    - description
    - protocol
    - region
    - destination_port_range
    - source_port_range
EOT

  type = map(object({
    destination_cidr_block   = string
    rule_action              = string
    rule_number              = number
    source_cidr_block        = string
    traffic_direction        = string
    traffic_mirror_filter_id = string
    description              = optional(string)
    protocol                 = optional(number)
    region                   = optional(string)
    destination_port_range   = optional(list(object({
            from_port = optional(number)
            to_port   = optional(number)
        })))
    source_port_range        = optional(list(object({
            from_port = optional(number)
            to_port   = optional(number)
        })))
  }))
}
