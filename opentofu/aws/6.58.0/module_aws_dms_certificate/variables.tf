variable "dms_certificates" {
  description = <<EOT
Map of dms_certificates, attributes below
Required:
    - certificate_id
Optional:
    - certificate_pem
    - certificate_wallet
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    certificate_id     = string
    certificate_pem    = optional(string)
    certificate_wallet = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
