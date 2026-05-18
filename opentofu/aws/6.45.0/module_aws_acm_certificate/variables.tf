variable "acm_certificates" {
  description = <<EOT
Map of acm_certificates, attributes below
Optional:
    - certificate_authority_arn
    - certificate_body
    - certificate_chain
    - domain_name
    - early_renewal_duration
    - key_algorithm
    - private_key
    - region
    - subject_alternative_names
    - tags
    - tags_all
    - validation_method
    - options
    - validation_option
EOT

  type = map(object({
    certificate_authority_arn = optional(string)
    certificate_body          = optional(string)
    certificate_chain         = optional(string)
    domain_name               = optional(string)
    early_renewal_duration    = optional(string)
    key_algorithm             = optional(string)
    private_key               = optional(string)
    region                    = optional(string)
    subject_alternative_names = optional(set(string))
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    validation_method         = optional(string)
    options                   = optional(list(object({
            certificate_transparency_logging_preference = optional(string)
            export                                      = optional(string)
        })))
    validation_option         = optional(set(object({
            domain_name       = string
            validation_domain = string
        })))
  }))
}
