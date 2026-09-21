variable "vpc_security_group_ingress_rules" {
  description = <<EOT
Map of vpc_security_group_ingress_rules, attributes below
Required:
    - ip_protocol
    - security_group_id
Optional:
    - cidr_ipv4
    - cidr_ipv6
    - description
    - from_port
    - prefix_list_id
    - referenced_security_group_id
    - region
    - tags
    - to_port
EOT

  type = map(object({
    ip_protocol                  = string
    security_group_id            = string
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    to_port                      = optional(number)
  }))
}
