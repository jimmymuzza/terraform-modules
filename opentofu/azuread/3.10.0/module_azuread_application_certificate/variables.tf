variable "application_certificates" {
  description = <<EOT
Map of application_certificates, attributes below
Required:
    - application_id
    - value
Optional:
    - encoding
    - end_date
    - end_date_relative
    - key_id
    - start_date
    - type
EOT

  type = map(object({
    application_id    = string
    value             = string
    encoding          = optional(string)
    end_date          = optional(string)
    end_date_relative = optional(string)
    key_id            = optional(string)
    start_date        = optional(string)
    type              = optional(string)
  }))
}
