variable "network_interface_sg_attachments" {
  description = <<EOT
Map of network_interface_sg_attachments, attributes below
Required:
    - network_interface_id
    - security_group_id
Optional:
    - region
EOT

  type = map(object({
    network_interface_id = string
    security_group_id    = string
    region               = optional(string)
  }))
}
