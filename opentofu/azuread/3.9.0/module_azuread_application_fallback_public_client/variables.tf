variable "application_fallback_public_clients" {
  description = <<EOT
Map of application_fallback_public_clients, attributes below
Required:
    - application_id
Optional:
    - enabled
EOT

  type = map(object({
    application_id = string
    enabled        = optional(bool)
  }))
}
