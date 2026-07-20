variable "route53_resolver_firewall_rule_groups" {
  description = <<EOT
Map of route53_resolver_firewall_rule_groups, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name     = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
