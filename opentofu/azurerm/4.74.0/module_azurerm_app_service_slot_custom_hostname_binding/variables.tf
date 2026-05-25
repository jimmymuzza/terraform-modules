variable "app_service_slot_custom_hostname_bindings" {
  description = <<EOT
Map of app_service_slot_custom_hostname_bindings, attributes below
Required:
    - app_service_slot_id
    - hostname
Optional:
    - ssl_state
    - thumbprint
EOT

  type = map(object({
    app_service_slot_id = string
    hostname            = string
    ssl_state           = optional(string)
    thumbprint          = optional(string)
  }))
}
