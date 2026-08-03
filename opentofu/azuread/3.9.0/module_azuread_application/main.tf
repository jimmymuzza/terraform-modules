resource "azuread_application" "applications" {
  for_each = var.applications

  display_name                   = each.value.display_name
  description                    = each.value.description
  device_only_auth_enabled       = each.value.device_only_auth_enabled
  fallback_public_client_enabled = each.value.fallback_public_client_enabled
  group_membership_claims        = each.value.group_membership_claims
  identifier_uris                = each.value.identifier_uris
  logo_image                     = each.value.logo_image
  marketing_url                  = each.value.marketing_url
  notes                          = each.value.notes
  oauth2_post_response_required  = each.value.oauth2_post_response_required
  owners                         = each.value.owners
  prevent_duplicate_names        = each.value.prevent_duplicate_names
  privacy_statement_url          = each.value.privacy_statement_url
  service_management_reference   = each.value.service_management_reference
  sign_in_audience               = each.value.sign_in_audience
  support_url                    = each.value.support_url
  tags                           = each.value.tags
  template_id                    = each.value.template_id
  terms_of_service_url           = each.value.terms_of_service_url

  dynamic "api" {
    for_each = each.value.api != null ? each.value.api : []
    content {
      known_client_applications      = api.value.known_client_applications
      mapped_claims_enabled          = api.value.mapped_claims_enabled
      requested_access_token_version = api.value.requested_access_token_version

      dynamic "oauth2_permission_scope" {
        for_each = api.value.oauth2_permission_scope != null ? api.value.oauth2_permission_scope : []
        content {
          admin_consent_description  = oauth2_permission_scope.value.admin_consent_description
          admin_consent_display_name = oauth2_permission_scope.value.admin_consent_display_name
          enabled                    = oauth2_permission_scope.value.enabled
          type                       = oauth2_permission_scope.value.type
          user_consent_description   = oauth2_permission_scope.value.user_consent_description
          user_consent_display_name  = oauth2_permission_scope.value.user_consent_display_name
          value                      = oauth2_permission_scope.value.value
        }
      }
    }
  }

  dynamic "app_role" {
    for_each = each.value.app_role != null ? each.value.app_role : []
    content {
      allowed_member_types = app_role.value.allowed_member_types
      description          = app_role.value.description
      display_name         = app_role.value.display_name
      enabled              = app_role.value.enabled
      value                = app_role.value.value
    }
  }

  dynamic "feature_tags" {
    for_each = each.value.feature_tags != null ? each.value.feature_tags : []
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  dynamic "optional_claims" {
    for_each = each.value.optional_claims != null ? each.value.optional_claims : []
    content {

      dynamic "access_token" {
        for_each = optional_claims.value.access_token != null ? optional_claims.value.access_token : []
        content {
          name                  = access_token.value.name
          additional_properties = access_token.value.additional_properties
          essential             = access_token.value.essential
          source                = access_token.value.source
        }
      }

      dynamic "id_token" {
        for_each = optional_claims.value.id_token != null ? optional_claims.value.id_token : []
        content {
          name                  = id_token.value.name
          additional_properties = id_token.value.additional_properties
          essential             = id_token.value.essential
          source                = id_token.value.source
        }
      }

      dynamic "saml2_token" {
        for_each = optional_claims.value.saml2_token != null ? optional_claims.value.saml2_token : []
        content {
          name                  = saml2_token.value.name
          additional_properties = saml2_token.value.additional_properties
          essential             = saml2_token.value.essential
          source                = saml2_token.value.source
        }
      }
    }
  }

  dynamic "password" {
    for_each = each.value.password != null ? each.value.password : []
    content {
      display_name = password.value.display_name
      end_date     = password.value.end_date
      start_date   = password.value.start_date
    }
  }

  dynamic "public_client" {
    for_each = each.value.public_client != null ? each.value.public_client : []
    content {
      redirect_uris = public_client.value.redirect_uris
    }
  }

  dynamic "required_resource_access" {
    for_each = each.value.required_resource_access != null ? each.value.required_resource_access : []
    content {
      resource_app_id = required_resource_access.value.resource_app_id

      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access != null ? required_resource_access.value.resource_access : []
        content {
          type = resource_access.value.type
        }
      }
    }
  }

  dynamic "single_page_application" {
    for_each = each.value.single_page_application != null ? each.value.single_page_application : []
    content {
      redirect_uris = single_page_application.value.redirect_uris
    }
  }

  dynamic "web" {
    for_each = each.value.web != null ? each.value.web : []
    content {
      homepage_url  = web.value.homepage_url
      logout_url    = web.value.logout_url
      redirect_uris = web.value.redirect_uris

      dynamic "implicit_grant" {
        for_each = web.value.implicit_grant != null ? web.value.implicit_grant : []
        content {
          access_token_issuance_enabled = implicit_grant.value.access_token_issuance_enabled
          id_token_issuance_enabled     = implicit_grant.value.id_token_issuance_enabled
        }
      }
    }
  }
}
