variable "ec2_client_vpn_authorization_rules" {
  description = <<EOT
Map of ec2_client_vpn_authorization_rules, attributes below
Required:
    - client_vpn_endpoint_id
    - target_network_cidr
Optional:
    - access_group_id
    - authorize_all_groups
    - description
    - region
EOT

  type = map(object({
    client_vpn_endpoint_id = string
    target_network_cidr    = string
    access_group_id        = optional(string)
    authorize_all_groups   = optional(bool)
    description            = optional(string)
    region                 = optional(string)
  }))
}
