variable "synchronization_secrets" {
  description = <<EOT
Map of synchronization_secrets, attributes below
Required:
    - service_principal_id
Optional:
    - credential
EOT

  type = map(object({
    service_principal_id = string
    credential           = optional(list(object({
            key   = string
            value = string
        })))
  }))
}
