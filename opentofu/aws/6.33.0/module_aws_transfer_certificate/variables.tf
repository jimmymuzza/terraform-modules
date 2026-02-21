variable "transfer_certificates" {
  description = <<EOT
Map of transfer_certificates, attributes below
Required:
    - certificate
    - usage
Optional:
    - certificate_chain
    - description
    - private_key
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    certificate       = string
    usage             = string
    certificate_chain = optional(string)
    description       = optional(string)
    private_key       = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
