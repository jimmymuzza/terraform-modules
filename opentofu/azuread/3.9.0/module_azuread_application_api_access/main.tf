resource "azuread_application_api_access" "application_api_accesses" {
  for_each = var.application_api_accesses

  api_client_id  = each.value.api_client_id
  application_id = each.value.application_id
  role_ids       = each.value.role_ids
  scope_ids      = each.value.scope_ids
}
