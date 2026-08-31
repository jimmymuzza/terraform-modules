variable "dx_hosted_transit_virtual_interface_accepters" {
  description = <<EOT
Map of dx_hosted_transit_virtual_interface_accepters, attributes below
Required:
    - dx_gateway_id
    - virtual_interface_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    dx_gateway_id        = string
    virtual_interface_id = string
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
