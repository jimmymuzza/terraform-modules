variable "acm_certificate_validations" {
  description = <<EOT
Map of acm_certificate_validations, attributes below
Required:
    - certificate_arn
Optional:
    - region
    - validation_record_fqdns
EOT

  type = map(object({
    certificate_arn         = string
    region                  = optional(string)
    validation_record_fqdns = optional(set(string))
  }))
}
