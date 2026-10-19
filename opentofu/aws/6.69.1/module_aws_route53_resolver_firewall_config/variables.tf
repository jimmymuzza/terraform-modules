variable "route53_resolver_firewall_configs" {
  description = <<EOT
Map of route53_resolver_firewall_configs, attributes below
Required:
    - resource_id
Optional:
    - firewall_fail_open
    - region
EOT

  type = map(object({
    resource_id        = string
    firewall_fail_open = optional(string)
    region             = optional(string)
  }))
}
