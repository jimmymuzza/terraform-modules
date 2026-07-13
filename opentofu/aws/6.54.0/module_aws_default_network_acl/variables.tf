variable "default_network_acls" {
  description = <<EOT
Map of default_network_acls, attributes below
Required:
    - default_network_acl_id
Optional:
    - region
    - subnet_ids
    - tags
    - tags_all
    - egress
    - ingress
EOT

  type = map(object({
    default_network_acl_id = string
    region                 = optional(string)
    subnet_ids             = optional(set(string))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    egress                 = optional(set(object({
            action          = string
            from_port       = number
            protocol        = string
            rule_no         = number
            to_port         = number
            cidr_block      = optional(string)
            icmp_code       = optional(number)
            icmp_type       = optional(number)
            ipv6_cidr_block = optional(string)
        })))
    ingress                = optional(set(object({
            action          = string
            from_port       = number
            protocol        = string
            rule_no         = number
            to_port         = number
            cidr_block      = optional(string)
            icmp_code       = optional(number)
            icmp_type       = optional(number)
            ipv6_cidr_block = optional(string)
        })))
  }))
}
