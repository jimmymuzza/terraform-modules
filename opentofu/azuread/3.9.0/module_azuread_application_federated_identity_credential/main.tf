resource "azuread_application_federated_identity_credential" "application_federated_identity_credentials" {
  for_each = var.application_federated_identity_credentials

  application_id = each.value.application_id
  audiences      = each.value.audiences
  display_name   = each.value.display_name
  issuer         = each.value.issuer
  subject        = each.value.subject
  description    = each.value.description
}
