variable "dev_center_attached_networks" {
  description = <<EOT
Map of dev_center_attached_networks, attributes below
Required:
    - dev_center_id
    - name
    - network_connection_id
EOT

  type = map(object({
    dev_center_id         = string
    name                  = string
    network_connection_id = string
  }))
}
