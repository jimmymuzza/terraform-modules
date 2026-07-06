variable "eip_associations" {
  description = <<EOT
Map of eip_associations, attributes below
Optional:
    - allocation_id
    - allow_reassociation
    - instance_id
    - network_interface_id
    - private_ip_address
    - public_ip
    - region
EOT

  type = map(object({
    allocation_id        = optional(string)
    allow_reassociation  = optional(bool)
    instance_id          = optional(string)
    network_interface_id = optional(string)
    private_ip_address   = optional(string)
    public_ip            = optional(string)
    region               = optional(string)
  }))
}
