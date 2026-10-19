variable "service_principals" {
  description = <<EOT
Map of service_principals, attributes below
Required:
    - client_id
Optional:
    - account_enabled
    - alternative_names
    - app_role_assignment_required
    - description
    - login_url
    - notes
    - notification_email_addresses
    - owners
    - preferred_single_sign_on_mode
    - tags
    - use_existing
    - feature_tags
    - features
    - saml_single_sign_on
EOT

  type = map(object({
    client_id                     = string
    account_enabled               = optional(bool)
    alternative_names             = optional(set(string))
    app_role_assignment_required  = optional(bool)
    description                   = optional(string)
    login_url                     = optional(string)
    notes                         = optional(string)
    notification_email_addresses  = optional(set(string))
    owners                        = optional(set(string))
    preferred_single_sign_on_mode = optional(string)
    tags                          = optional(set(string))
    use_existing                  = optional(bool)
    feature_tags                  = optional(list(object({
            custom_single_sign_on = optional(bool)
            enterprise            = optional(bool)
            gallery               = optional(bool)
            hide                  = optional(bool)
        })))
    features                      = optional(list(object({
            custom_single_sign_on_app = optional(bool)
            enterprise_application    = optional(bool)
            gallery_application       = optional(bool)
            visible_to_users          = optional(bool)
        })))
    saml_single_sign_on           = optional(list(object({
            relay_state = optional(string)
        })))
  }))
}
