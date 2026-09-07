variable "route53_resolver_firewall_domain_lists" {
  description = <<EOT
Map of route53_resolver_firewall_domain_lists, attributes below
Required:
    - name
Optional:
    - domains
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name     = string
    domains  = optional(set(string))
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
