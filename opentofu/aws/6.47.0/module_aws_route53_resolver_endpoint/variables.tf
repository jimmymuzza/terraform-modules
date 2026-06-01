variable "route53_resolver_endpoints" {
  description = <<EOT
Map of route53_resolver_endpoints, attributes below
Required:
    - direction
    - security_group_ids
    - ip_address
Optional:
    - name
    - protocols
    - region
    - resolver_endpoint_type
    - rni_enhanced_metrics_enabled
    - tags
    - tags_all
    - target_name_server_metrics_enabled
EOT

  type = map(object({
    direction                          = string
    security_group_ids                 = set(string)
    name                               = optional(string)
    protocols                          = optional(set(string))
    region                             = optional(string)
    resolver_endpoint_type             = optional(string)
    rni_enhanced_metrics_enabled       = optional(bool)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    target_name_server_metrics_enabled = optional(bool)
    ip_address                         = set(object({
            subnet_id = string
            ip        = optional(string)
            ipv6      = optional(string)
        }))
  }))
}
