variable "route53_resolver_dnssec_configs" {
  description = <<EOT
Map of route53_resolver_dnssec_configs, attributes below
Required:
    - resource_id
Optional:
    - region
EOT

  type = map(object({
    resource_id = string
    region      = optional(string)
  }))
}
