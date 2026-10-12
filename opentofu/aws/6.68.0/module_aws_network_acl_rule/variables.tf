variable "network_acl_rules" {
  description = <<EOT
Map of network_acl_rules, attributes below
Required:
    - network_acl_id
    - protocol
    - rule_action
    - rule_number
Optional:
    - cidr_block
    - egress
    - from_port
    - icmp_code
    - icmp_type
    - ipv6_cidr_block
    - region
    - to_port
EOT

  type = map(object({
    network_acl_id  = string
    protocol        = string
    rule_action     = string
    rule_number     = number
    cidr_block      = optional(string)
    egress          = optional(bool)
    from_port       = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    ipv6_cidr_block = optional(string)
    region          = optional(string)
    to_port         = optional(number)
  }))
}
