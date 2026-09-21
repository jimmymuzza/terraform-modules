variable "service_principal_token_signing_certificates" {
  description = <<EOT
Map of service_principal_token_signing_certificates, attributes below
Required:
    - service_principal_id
Optional:
    - display_name
    - end_date
EOT

  type = map(object({
    service_principal_id = string
    display_name         = optional(string)
    end_date             = optional(string)
  }))
}
