variable "networkmanager_connections" {
  description = <<EOT
Map of networkmanager_connections, attributes below
Required:
    - connected_device_id
    - device_id
    - global_network_id
Optional:
    - connected_link_id
    - description
    - link_id
    - tags
    - tags_all
EOT

  type = map(object({
    connected_device_id = string
    device_id           = string
    global_network_id   = string
    connected_link_id   = optional(string)
    description         = optional(string)
    link_id             = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
