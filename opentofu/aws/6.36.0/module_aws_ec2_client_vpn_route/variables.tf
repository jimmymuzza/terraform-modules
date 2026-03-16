variable "ec2_client_vpn_routes" {
  description = <<EOT
Map of ec2_client_vpn_routes, attributes below
Required:
    - client_vpn_endpoint_id
    - destination_cidr_block
    - target_vpc_subnet_id
Optional:
    - description
    - region
EOT

  type = map(object({
    client_vpn_endpoint_id = string
    destination_cidr_block = string
    target_vpc_subnet_id   = string
    description            = optional(string)
    region                 = optional(string)
  }))
}
