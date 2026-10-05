variable "networkmanager_link_associations" {
  description = <<EOT
Map of networkmanager_link_associations, attributes below
Required:
    - device_id
    - global_network_id
    - link_id
EOT

  type = map(object({
    device_id         = string
    global_network_id = string
    link_id           = string
  }))
}
