variable "dx_hosted_public_virtual_interface_accepters" {
  description = <<EOT
Map of dx_hosted_public_virtual_interface_accepters, attributes below
Required:
    - virtual_interface_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    virtual_interface_id = string
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
