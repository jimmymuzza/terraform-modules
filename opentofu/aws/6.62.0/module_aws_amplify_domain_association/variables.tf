variable "amplify_domain_associations" {
  description = <<EOT
Map of amplify_domain_associations, attributes below
Required:
    - app_id
    - domain_name
    - sub_domain
Optional:
    - enable_auto_sub_domain
    - region
    - wait_for_verification
    - certificate_settings
EOT

  type = map(object({
    app_id                 = string
    domain_name            = string
    enable_auto_sub_domain = optional(bool)
    region                 = optional(string)
    wait_for_verification  = optional(bool)
    certificate_settings   = optional(list(object({
            type                   = string
            custom_certificate_arn = optional(string)
        })))
    sub_domain             = set(object({
            branch_name = string
            prefix      = string
        }))
  }))
}
