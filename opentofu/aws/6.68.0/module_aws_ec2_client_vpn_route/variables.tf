variable "ec2_client_vpn_routes" {
  description = <<EOT
Map of ec2_client_vpn_routes, attributes below
Required:
    - client_vpn_endpoint_id
    - destination_cidr_block
Optional:
    - description
    - region
    - target_vpc_subnet_id
EOT

  type = map(object({
    client_vpn_endpoint_id = string
    destination_cidr_block = string
    description            = optional(string)
    region                 = optional(string)
    target_vpc_subnet_id   = optional(string)
  }))
}
