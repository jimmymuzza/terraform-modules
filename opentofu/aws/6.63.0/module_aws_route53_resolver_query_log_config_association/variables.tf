variable "route53_resolver_query_log_config_associations" {
  description = <<EOT
Map of route53_resolver_query_log_config_associations, attributes below
Required:
    - resolver_query_log_config_id
    - resource_id
Optional:
    - region
EOT

  type = map(object({
    resolver_query_log_config_id = string
    resource_id                  = string
    region                       = optional(string)
  }))
}
