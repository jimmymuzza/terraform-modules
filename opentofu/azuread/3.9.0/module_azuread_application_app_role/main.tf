resource "azuread_application_app_role" "application_app_roles" {
  for_each = var.application_app_roles

  allowed_member_types = each.value.allowed_member_types
  application_id       = each.value.application_id
  description          = each.value.description
  display_name         = each.value.display_name
  role_id              = each.value.role_id
  value                = each.value.value
}
