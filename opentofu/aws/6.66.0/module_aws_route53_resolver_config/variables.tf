variable "route53_resolver_configs" {
  description = <<EOT
Map of route53_resolver_configs, attributes below
Required:
    - autodefined_reverse_flag
    - resource_id
Optional:
    - region
EOT

  type = map(object({
    autodefined_reverse_flag = string
    resource_id              = string
    region                   = optional(string)
  }))
}
