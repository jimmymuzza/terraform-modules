variable "network_acls" {
  description = <<EOT
Map of network_acls, attributes below
Required:
    - vpc_id
Optional:
    - egress
    - ingress
    - region
    - subnet_ids
    - tags
    - tags_all
EOT

  type = map(object({
    vpc_id     = string
    egress     = optional(set(object({
            action = string
            cidr_block = string
            from_port = number
            icmp_code = number
            icmp_type = number
            ipv6_cidr_block = string
            protocol = string
            rule_no = number
            to_port = number
        })))
    ingress    = optional(set(object({
            action = string
            cidr_block = string
            from_port = number
            icmp_code = number
            icmp_type = number
            ipv6_cidr_block = string
            protocol = string
            rule_no = number
            to_port = number
        })))
    region     = optional(string)
    subnet_ids = optional(set(string))
    tags       = optional(map(string))
    tags_all   = optional(map(string))
  }))
}
