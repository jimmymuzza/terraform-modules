resource "azuread_application_fallback_public_client" "application_fallback_public_clients" {
  for_each = var.application_fallback_public_clients

  application_id = each.value.application_id
  enabled        = each.value.enabled
}
