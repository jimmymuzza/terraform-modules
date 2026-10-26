variable "route53domains_delegation_signer_records" {
  description = <<EOT
Map of route53domains_delegation_signer_records, attributes below
Required:
    - domain_name
Optional:
    - signing_attributes
EOT

  type = map(object({
    domain_name        = string
    signing_attributes = optional(list(object({
            algorithm  = number
            flags      = number
            public_key = string
        })))
  }))
}
