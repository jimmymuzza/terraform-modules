resource "azuread_application_identifier_uri" "application_identifier_uris" {
  for_each = var.application_identifier_uris

  application_id = each.value.application_id
  identifier_uri = each.value.identifier_uri
}
