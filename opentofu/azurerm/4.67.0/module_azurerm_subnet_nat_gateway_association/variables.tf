variable "subnet_nat_gateway_associations" {
  description = <<EOT
Map of subnet_nat_gateway_associations, attributes below
Required:
    - nat_gateway_id
    - subnet_id
EOT

  type = map(object({
    nat_gateway_id = string
    subnet_id      = string
  }))
}
