variable "applications" {
  description = <<EOT
Map of applications, attributes below
Required:
    - display_name
Optional:
    - description
    - device_only_auth_enabled
    - fallback_public_client_enabled
    - group_membership_claims
    - identifier_uris
    - logo_image
    - marketing_url
    - notes
    - oauth2_post_response_required
    - owners
    - prevent_duplicate_names
    - privacy_statement_url
    - service_management_reference
    - sign_in_audience
    - support_url
    - tags
    - template_id
    - terms_of_service_url
    - api
    - app_role
    - feature_tags
    - optional_claims
    - password
    - public_client
    - required_resource_access
    - single_page_application
    - web
EOT

  type = map(object({
    display_name                   = string
    description                    = optional(string)
    device_only_auth_enabled       = optional(bool)
    fallback_public_client_enabled = optional(bool)
    group_membership_claims        = optional(set(string))
    identifier_uris                = optional(set(string))
    logo_image                     = optional(string)
    marketing_url                  = optional(string)
    notes                          = optional(string)
    oauth2_post_response_required  = optional(bool)
    owners                         = optional(set(string))
    prevent_duplicate_names        = optional(bool)
    privacy_statement_url          = optional(string)
    service_management_reference   = optional(string)
    sign_in_audience               = optional(string)
    support_url                    = optional(string)
    tags                           = optional(set(string))
    template_id                    = optional(string)
    terms_of_service_url           = optional(string)
    api                            = optional(list(object({
            known_client_applications      = optional(set(string))
            mapped_claims_enabled          = optional(bool)
            requested_access_token_version = optional(number)
            oauth2_permission_scope        = optional(set(object({
                admin_consent_description  = optional(string)
                admin_consent_display_name = optional(string)
                enabled                    = optional(bool)
                type                       = optional(string)
                user_consent_description   = optional(string)
                user_consent_display_name  = optional(string)
                value                      = optional(string)
            })))
        })))
    app_role                       = optional(set(object({
            allowed_member_types = set(string)
            description          = string
            display_name         = string
            enabled              = optional(bool)
            value                = optional(string)
        })))
    feature_tags                   = optional(list(object({
            custom_single_sign_on = optional(bool)
            enterprise            = optional(bool)
            gallery               = optional(bool)
            hide                  = optional(bool)
        })))
    optional_claims                = optional(list(object({
            access_token = optional(list(object({
                name                  = string
                additional_properties = optional(list(string))
                essential             = optional(bool)
                source                = optional(string)
            })))
            id_token     = optional(list(object({
                name                  = string
                additional_properties = optional(list(string))
                essential             = optional(bool)
                source                = optional(string)
            })))
            saml2_token  = optional(list(object({
                name                  = string
                additional_properties = optional(list(string))
                essential             = optional(bool)
                source                = optional(string)
            })))
        })))
    password                       = optional(set(object({
            display_name = string
            end_date     = optional(string)
            start_date   = optional(string)
        })))
    public_client                  = optional(list(object({
            redirect_uris = optional(set(string))
        })))
    required_resource_access       = optional(set(object({
            resource_app_id = string
            resource_access = list(object({
                type = string
            }))
        })))
    single_page_application        = optional(list(object({
            redirect_uris = optional(set(string))
        })))
    web                            = optional(list(object({
            homepage_url   = optional(string)
            logout_url     = optional(string)
            redirect_uris  = optional(set(string))
            implicit_grant = optional(list(object({
                access_token_issuance_enabled = optional(bool)
                id_token_issuance_enabled     = optional(bool)
            })))
        })))
  }))
}
