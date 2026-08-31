variable "rds_certificates" {
  description = <<EOT
Map of rds_certificates, attributes below
Required:
    - certificate_identifier
Optional:
    - region
EOT

  type = map(object({
    certificate_identifier = string
    region                 = optional(string)
  }))
}
