variable "acmpca_certificate_authorities" {
  description = <<EOT
Map of acmpca_certificate_authorities, attributes below
Required:
    - certificate_authority_configuration
Optional:
    - enabled
    - key_storage_security_standard
    - permanent_deletion_time_in_days
    - region
    - tags
    - tags_all
    - type
    - usage_mode
    - revocation_configuration
EOT

  type = map(object({
    enabled                             = optional(bool)
    key_storage_security_standard       = optional(string)
    permanent_deletion_time_in_days     = optional(number)
    region                              = optional(string)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    type                                = optional(string)
    usage_mode                          = optional(string)
    certificate_authority_configuration = list(object({
            key_algorithm     = string
            signing_algorithm = string
            subject           = list(object({
                common_name                  = optional(string)
                country                      = optional(string)
                distinguished_name_qualifier = optional(string)
                generation_qualifier         = optional(string)
                given_name                   = optional(string)
                initials                     = optional(string)
                locality                     = optional(string)
                organization                 = optional(string)
                organizational_unit          = optional(string)
                pseudonym                    = optional(string)
                state                        = optional(string)
                surname                      = optional(string)
                title                        = optional(string)
            }))
        }))
    revocation_configuration            = optional(list(object({
            crl_configuration  = optional(list(object({
                custom_cname       = optional(string)
                custom_path        = optional(string)
                enabled            = optional(bool)
                expiration_in_days = optional(number)
                s3_bucket_name     = optional(string)
                s3_object_acl      = optional(string)
            })))
            ocsp_configuration = optional(list(object({
                enabled           = bool
                ocsp_custom_cname = optional(string)
            })))
        })))
  }))
}
