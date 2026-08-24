variable "dx_hosted_private_virtual_interface_accepters" {
  description = <<EOT
Map of dx_hosted_private_virtual_interface_accepters, attributes below
Required:
    - virtual_interface_id
Optional:
    - dx_gateway_id
    - region
    - tags
    - tags_all
    - vpn_gateway_id
EOT

  type = map(object({
    virtual_interface_id = string
    dx_gateway_id        = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    vpn_gateway_id       = optional(string)
  }))
}
