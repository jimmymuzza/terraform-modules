variable "application_registrations" {
  description = <<EOT
Map of application_registrations, attributes below
Required:
    - display_name
Optional:
    - description
    - group_membership_claims
    - homepage_url
    - implicit_access_token_issuance_enabled
    - implicit_id_token_issuance_enabled
    - logout_url
    - marketing_url
    - notes
    - privacy_statement_url
    - requested_access_token_version
    - service_management_reference
    - sign_in_audience
    - support_url
    - terms_of_service_url
EOT

  type = map(object({
    display_name                           = string
    description                            = optional(string)
    group_membership_claims                = optional(set(string))
    homepage_url                           = optional(string)
    implicit_access_token_issuance_enabled = optional(bool)
    implicit_id_token_issuance_enabled     = optional(bool)
    logout_url                             = optional(string)
    marketing_url                          = optional(string)
    notes                                  = optional(string)
    privacy_statement_url                  = optional(string)
    requested_access_token_version         = optional(number)
    service_management_reference           = optional(string)
    sign_in_audience                       = optional(string)
    support_url                            = optional(string)
    terms_of_service_url                   = optional(string)
  }))
}
