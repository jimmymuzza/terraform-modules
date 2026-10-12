variable "iot_ca_certificates" {
  description = <<EOT
Map of iot_ca_certificates, attributes below
Required:
    - active
    - allow_auto_registration
    - ca_certificate_pem
Optional:
    - certificate_mode
    - region
    - tags
    - tags_all
    - verification_certificate_pem
    - registration_config
EOT

  type = map(object({
    active                       = bool
    allow_auto_registration      = bool
    ca_certificate_pem           = string
    certificate_mode             = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    verification_certificate_pem = optional(string)
    registration_config          = optional(list(object({
            role_arn      = optional(string)
            template_body = optional(string)
            template_name = optional(string)
        })))
  }))
}
