variable "vpc_endpoint_services" {
  description = <<EOT
Map of vpc_endpoint_services, attributes below
Required:
    - acceptance_required
Optional:
    - allowed_principals
    - gateway_load_balancer_arns
    - network_load_balancer_arns
    - private_dns_name
    - region
    - supported_ip_address_types
    - supported_regions
    - tags
    - tags_all
EOT

  type = map(object({
    acceptance_required        = bool
    allowed_principals         = optional(set(string))
    gateway_load_balancer_arns = optional(set(string))
    network_load_balancer_arns = optional(set(string))
    private_dns_name           = optional(string)
    region                     = optional(string)
    supported_ip_address_types = optional(set(string))
    supported_regions          = optional(set(string))
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
