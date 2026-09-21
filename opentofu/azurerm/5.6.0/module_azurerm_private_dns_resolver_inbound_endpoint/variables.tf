variable "private_dns_resolver_inbound_endpoints" {
  description = <<EOT
Map of private_dns_resolver_inbound_endpoints, attributes below
Required:
    - location
    - name
    - private_dns_resolver_id
    - ip_configurations
Optional:
    - tags
EOT

  type = map(object({
    location                = string
    name                    = string
    private_dns_resolver_id = string
    tags                    = optional(map(string))
    ip_configurations       = list(object({
            subnet_id                    = string
            private_ip_address           = optional(string)
            private_ip_allocation_method = optional(string)
        }))
  }))
}
