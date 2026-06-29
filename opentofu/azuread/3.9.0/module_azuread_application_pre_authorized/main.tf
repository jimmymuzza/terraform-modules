resource "azuread_application_pre_authorized" "application_pre_authorizeds" {
  for_each = var.application_pre_authorizeds

  application_id       = each.value.application_id
  authorized_client_id = each.value.authorized_client_id
  permission_ids       = each.value.permission_ids
}
