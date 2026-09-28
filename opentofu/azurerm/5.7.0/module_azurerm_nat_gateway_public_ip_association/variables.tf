variable "nat_gateway_public_ip_associations" {
  description = <<EOT
Map of nat_gateway_public_ip_associations, attributes below
Required:
    - nat_gateway_id
    - public_ip_address_id
EOT

  type = map(object({
    nat_gateway_id       = string
    public_ip_address_id = string
  }))
}
