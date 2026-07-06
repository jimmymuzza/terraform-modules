variable "route53_resolver_rules" {
  description = <<EOT
Map of route53_resolver_rules, attributes below
Required:
    - domain_name
    - rule_type
Optional:
    - name
    - region
    - resolver_endpoint_id
    - tags
    - tags_all
    - target_ip
EOT

  type = map(object({
    domain_name          = string
    rule_type            = string
    name                 = optional(string)
    region               = optional(string)
    resolver_endpoint_id = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    target_ip            = optional(set(object({
            ip       = optional(string)
            ipv6     = optional(string)
            port     = optional(number)
            protocol = optional(string)
        })))
  }))
}
