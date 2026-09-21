resource "azuread_application_flexible_federated_identity_credential" "application_flexible_federated_identity_credentials" {
  for_each = var.application_flexible_federated_identity_credentials

  application_id             = each.value.application_id
  audience                   = each.value.audience
  claims_matching_expression = each.value.claims_matching_expression
  display_name               = each.value.display_name
  issuer                     = each.value.issuer
  description                = each.value.description
}
