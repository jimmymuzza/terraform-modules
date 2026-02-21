variable "security_group_rules" {
  description = <<EOT
Map of security_group_rules, attributes below
Required:
    - from_port
    - protocol
    - security_group_id
    - to_port
    - type
Optional:
    - cidr_blocks
    - description
    - ipv6_cidr_blocks
    - prefix_list_ids
    - region
    - self
    - source_security_group_id
EOT

  type = map(object({
    from_port                = number
    protocol                 = string
    security_group_id        = string
    to_port                  = number
    type                     = string
    cidr_blocks              = optional(list(string))
    description              = optional(string)
    ipv6_cidr_blocks         = optional(list(string))
    prefix_list_ids          = optional(list(string))
    region                   = optional(string)
    self                     = optional(bool)
    source_security_group_id = optional(string)
  }))
}
