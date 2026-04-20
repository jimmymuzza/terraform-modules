variable "private_dns_resolver_virtual_network_links" {
  description = <<EOT
Map of private_dns_resolver_virtual_network_links, attributes below
Required:
    - dns_forwarding_ruleset_id
    - name
    - virtual_network_id
Optional:
    - metadata
EOT

  type = map(object({
    dns_forwarding_ruleset_id = string
    name                      = string
    virtual_network_id        = string
    metadata                  = optional(map(string))
  }))
}
