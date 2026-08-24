resource "azuread_service_principal" "service_principals" {
  for_each = var.service_principals

  client_id                     = each.value.client_id
  account_enabled               = each.value.account_enabled
  alternative_names             = each.value.alternative_names
  app_role_assignment_required  = each.value.app_role_assignment_required
  description                   = each.value.description
  login_url                     = each.value.login_url
  notes                         = each.value.notes
  notification_email_addresses  = each.value.notification_email_addresses
  owners                        = each.value.owners
  preferred_single_sign_on_mode = each.value.preferred_single_sign_on_mode
  tags                          = each.value.tags
  use_existing                  = each.value.use_existing

  dynamic "feature_tags" {
    for_each = each.value.feature_tags != null ? each.value.feature_tags : []
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  dynamic "features" {
    for_each = each.value.features != null ? each.value.features : []
    content {
      custom_single_sign_on_app = features.value.custom_single_sign_on_app
      enterprise_application    = features.value.enterprise_application
      gallery_application       = features.value.gallery_application
      visible_to_users          = features.value.visible_to_users
    }
  }

  dynamic "saml_single_sign_on" {
    for_each = each.value.saml_single_sign_on != null ? each.value.saml_single_sign_on : []
    content {
      relay_state = saml_single_sign_on.value.relay_state
    }
  }
}
