variable "ec2_client_vpn_network_associations" {
  description = <<EOT
Map of ec2_client_vpn_network_associations, attributes below
Required:
    - client_vpn_endpoint_id
    - subnet_id
Optional:
    - region
EOT

  type = map(object({
    client_vpn_endpoint_id = string
    subnet_id              = string
    region                 = optional(string)
  }))
}
