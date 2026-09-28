variable "app_service_virtual_network_swift_connections" {
  description = <<EOT
Map of app_service_virtual_network_swift_connections, attributes below
Required:
    - app_service_id
    - subnet_id
EOT

  type = map(object({
    app_service_id = string
    subnet_id      = string
  }))
}
