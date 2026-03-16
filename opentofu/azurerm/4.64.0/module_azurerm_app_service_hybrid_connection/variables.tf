variable "app_service_hybrid_connections" {
  description = <<EOT
Map of app_service_hybrid_connections, attributes below
Required:
    - app_service_name
    - hostname
    - port
    - relay_id
    - resource_group_name
Optional:
    - send_key_name
EOT

  type = map(object({
    app_service_name    = string
    hostname            = string
    port                = number
    relay_id            = string
    resource_group_name = string
    send_key_name       = optional(string)
  }))
}
