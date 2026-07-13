resource "azuread_conditional_access_policy" "conditional_access_policies" {
  for_each = var.conditional_access_policies

  display_name = each.value.display_name
  state        = each.value.state

  dynamic "conditions" {
    for_each = each.value.conditions != null ? each.value.conditions : []
    content {
      client_app_types                     = conditions.value.client_app_types
      authentication_flow_transfer_methods = conditions.value.authentication_flow_transfer_methods
      insider_risk_levels                  = conditions.value.insider_risk_levels
      service_principal_risk_levels        = conditions.value.service_principal_risk_levels
      sign_in_risk_levels                  = conditions.value.sign_in_risk_levels
      user_risk_levels                     = conditions.value.user_risk_levels

      dynamic "applications" {
        for_each = conditions.value.applications != null ? conditions.value.applications : []
        content {
          excluded_applications = applications.value.excluded_applications
          included_applications = applications.value.included_applications
          included_user_actions = applications.value.included_user_actions

          dynamic "filter" {
            for_each = applications.value.filter != null ? applications.value.filter : []
            content {
              mode = filter.value.mode
              rule = filter.value.rule
            }
          }
        }
      }

      dynamic "client_applications" {
        for_each = conditions.value.client_applications != null ? conditions.value.client_applications : []
        content {
          excluded_service_principals = client_applications.value.excluded_service_principals
          included_service_principals = client_applications.value.included_service_principals

          dynamic "filter" {
            for_each = client_applications.value.filter != null ? client_applications.value.filter : []
            content {
              mode = filter.value.mode
              rule = filter.value.rule
            }
          }
        }
      }

      dynamic "devices" {
        for_each = conditions.value.devices != null ? conditions.value.devices : []
        content {

          dynamic "filter" {
            for_each = devices.value.filter != null ? devices.value.filter : []
            content {
              mode = filter.value.mode
              rule = filter.value.rule
            }
          }
        }
      }

      dynamic "locations" {
        for_each = conditions.value.locations != null ? conditions.value.locations : []
        content {
          included_locations = locations.value.included_locations
          excluded_locations = locations.value.excluded_locations
        }
      }

      dynamic "platforms" {
        for_each = conditions.value.platforms != null ? conditions.value.platforms : []
        content {
          included_platforms = platforms.value.included_platforms
          excluded_platforms = platforms.value.excluded_platforms
        }
      }

      dynamic "users" {
        for_each = conditions.value.users != null ? conditions.value.users : []
        content {
          excluded_groups = users.value.excluded_groups
          excluded_roles  = users.value.excluded_roles
          excluded_users  = users.value.excluded_users
          included_groups = users.value.included_groups
          included_roles  = users.value.included_roles
          included_users  = users.value.included_users

          dynamic "excluded_guests_or_external_users" {
            for_each = users.value.excluded_guests_or_external_users != null ? users.value.excluded_guests_or_external_users : []
            content {
              guest_or_external_user_types = excluded_guests_or_external_users.value.guest_or_external_user_types

              dynamic "external_tenants" {
                for_each = excluded_guests_or_external_users.value.external_tenants != null ? excluded_guests_or_external_users.value.external_tenants : []
                content {
                  membership_kind = external_tenants.value.membership_kind
                  members         = external_tenants.value.members
                }
              }
            }
          }

          dynamic "included_guests_or_external_users" {
            for_each = users.value.included_guests_or_external_users != null ? users.value.included_guests_or_external_users : []
            content {
              guest_or_external_user_types = included_guests_or_external_users.value.guest_or_external_user_types

              dynamic "external_tenants" {
                for_each = included_guests_or_external_users.value.external_tenants != null ? included_guests_or_external_users.value.external_tenants : []
                content {
                  membership_kind = external_tenants.value.membership_kind
                  members         = external_tenants.value.members
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "grant_controls" {
    for_each = each.value.grant_controls != null ? each.value.grant_controls : []
    content {
      operator                          = grant_controls.value.operator
      authentication_strength_policy_id = grant_controls.value.authentication_strength_policy_id
      built_in_controls                 = grant_controls.value.built_in_controls
      custom_authentication_factors     = grant_controls.value.custom_authentication_factors
      terms_of_use                      = grant_controls.value.terms_of_use
    }
  }

  dynamic "session_controls" {
    for_each = each.value.session_controls != null ? each.value.session_controls : []
    content {
      application_enforced_restrictions_enabled = session_controls.value.application_enforced_restrictions_enabled
      cloud_app_security_policy                 = session_controls.value.cloud_app_security_policy
      disable_resilience_defaults               = session_controls.value.disable_resilience_defaults
      persistent_browser_mode                   = session_controls.value.persistent_browser_mode
      sign_in_frequency                         = session_controls.value.sign_in_frequency
      sign_in_frequency_authentication_type     = session_controls.value.sign_in_frequency_authentication_type
      sign_in_frequency_interval                = session_controls.value.sign_in_frequency_interval
      sign_in_frequency_period                  = session_controls.value.sign_in_frequency_period
    }
  }
}
