variable "opensearch_domain_saml_options" {
  description = <<EOT
Map of opensearch_domain_saml_options, attributes below
Required:
    - domain_name
Optional:
    - region
    - saml_options
EOT

  type = map(object({
    domain_name  = string
    region       = optional(string)
    saml_options = optional(list(object({
            enabled                 = optional(bool)
            master_backend_role     = optional(string)
            master_user_name        = optional(string)
            roles_key               = optional(string)
            session_timeout_minutes = optional(number)
            subject_key             = optional(string)
            idp                     = optional(list(object({
                entity_id        = string
                metadata_content = string
            })))
        })))
  }))
}
