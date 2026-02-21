variable "private_dns_resolver_dns_forwarding_rulesets" {
  description = <<EOT
Map of private_dns_resolver_dns_forwarding_rulesets, attributes below
Required:
    - location
    - name
    - private_dns_resolver_outbound_endpoint_ids
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    location                                   = string
    name                                       = string
    private_dns_resolver_outbound_endpoint_ids = list(string)
    resource_group_name                        = string
    tags                                       = optional(map(string))
  }))
}
