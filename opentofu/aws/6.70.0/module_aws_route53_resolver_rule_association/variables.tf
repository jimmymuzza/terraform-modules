variable "route53_resolver_rule_associations" {
  description = <<EOT
Map of route53_resolver_rule_associations, attributes below
Required:
    - resolver_rule_id
    - vpc_id
Optional:
    - name
    - region
EOT

  type = map(object({
    resolver_rule_id = string
    vpc_id           = string
    name             = optional(string)
    region           = optional(string)
  }))
}
