variable "nat_gateway_public_ip_prefix_associations" {
  description = <<EOT
Map of nat_gateway_public_ip_prefix_associations, attributes below
Required:
    - nat_gateway_id
    - public_ip_prefix_id
EOT

  type = map(object({
    nat_gateway_id      = string
    public_ip_prefix_id = string
  }))
}
