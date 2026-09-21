variable "iot_certificates" {
  description = <<EOT
Map of iot_certificates, attributes below
Required:
    - active
Optional:
    - ca_pem
    - certificate_pem
    - csr
    - region
EOT

  type = map(object({
    active          = bool
    ca_pem          = optional(string)
    certificate_pem = optional(string)
    csr             = optional(string)
    region          = optional(string)
  }))
}
