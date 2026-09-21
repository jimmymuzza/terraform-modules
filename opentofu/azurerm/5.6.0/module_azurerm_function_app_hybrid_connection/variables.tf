variable "function_app_hybrid_connections" {
  description = <<EOT
Map of function_app_hybrid_connections, attributes below
Required:
    - function_app_id
    - hostname
    - port
    - relay_id
Optional:
    - send_key_name
EOT

  type = map(object({
    function_app_id = string
    hostname        = string
    port            = number
    relay_id        = string
    send_key_name   = optional(string)
  }))
}
