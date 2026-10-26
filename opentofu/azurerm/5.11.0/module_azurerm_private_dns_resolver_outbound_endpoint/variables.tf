variable "private_dns_resolver_outbound_endpoints" {
  description = <<EOT
Map of private_dns_resolver_outbound_endpoints, attributes below
Required:
    - location
    - name
    - private_dns_resolver_id
    - subnet_id
Optional:
    - tags
EOT

  type = map(object({
    location                = string
    name                    = string
    private_dns_resolver_id = string
    subnet_id               = string
    tags                    = optional(map(string))
  }))
}
