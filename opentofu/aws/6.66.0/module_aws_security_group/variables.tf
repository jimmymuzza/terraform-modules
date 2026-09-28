variable "security_groups" {
  description = <<EOT
Map of security_groups, attributes below
Optional:
    - description
    - egress
    - ingress
    - name
    - name_prefix
    - region
    - revoke_rules_on_delete
    - tags
    - tags_all
    - vpc_id
EOT

  type = map(object({
    description            = optional(string)
    egress                 = optional(set(object({
            cidr_blocks = list(string)
            description = string
            from_port = number
            ipv6_cidr_blocks = list(string)
            prefix_list_ids = list(string)
            protocol = string
            security_groups = set(string)
            self = bool
            to_port = number
        })))
    ingress                = optional(set(object({
            cidr_blocks = list(string)
            description = string
            from_port = number
            ipv6_cidr_blocks = list(string)
            prefix_list_ids = list(string)
            protocol = string
            security_groups = set(string)
            self = bool
            to_port = number
        })))
    name                   = optional(string)
    name_prefix            = optional(string)
    region                 = optional(string)
    revoke_rules_on_delete = optional(bool)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    vpc_id                 = optional(string)
  }))
}
