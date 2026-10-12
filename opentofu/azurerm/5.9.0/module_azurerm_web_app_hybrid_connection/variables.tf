variable "web_app_hybrid_connections" {
  description = <<EOT
Map of web_app_hybrid_connections, attributes below
Required:
    - hostname
    - port
    - relay_id
    - web_app_id
Optional:
    - send_key_name
EOT

  type = map(object({
    hostname      = string
    port          = number
    relay_id      = string
    web_app_id    = string
    send_key_name = optional(string)
  }))
}
