resource "azuread_service_principal_token_signing_certificate" "service_principal_token_signing_certificates" {
  for_each = var.service_principal_token_signing_certificates

  service_principal_id = each.value.service_principal_id
  display_name         = each.value.display_name
  end_date             = each.value.end_date
}
