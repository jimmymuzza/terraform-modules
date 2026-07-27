resource "azuread_application_permission_scope" "application_permission_scopes" {
  for_each = var.application_permission_scopes

  admin_consent_description  = each.value.admin_consent_description
  admin_consent_display_name = each.value.admin_consent_display_name
  application_id             = each.value.application_id
  scope_id                   = each.value.scope_id
  value                      = each.value.value
  type                       = each.value.type
  user_consent_description   = each.value.user_consent_description
  user_consent_display_name  = each.value.user_consent_display_name
}
