variable "redshift_hsm_client_certificates" {
  description = <<EOT
Map of redshift_hsm_client_certificates, attributes below
Required:
    - hsm_client_certificate_identifier
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    hsm_client_certificate_identifier = string
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
  }))
}
