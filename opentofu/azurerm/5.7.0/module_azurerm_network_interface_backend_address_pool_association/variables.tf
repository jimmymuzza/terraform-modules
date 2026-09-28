variable "network_interface_backend_address_pool_associations" {
  description = <<EOT
Map of network_interface_backend_address_pool_associations, attributes below
Required:
    - backend_address_pool_id
    - ip_configuration_name
    - network_interface_id
EOT

  type = map(object({
    backend_address_pool_id = string
    ip_configuration_name   = string
    network_interface_id    = string
  }))
}
