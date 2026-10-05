resource "azuread_application_redirect_uris" "application_redirect_uris" {
  for_each = var.application_redirect_uris

  application_id = each.value.application_id
  redirect_uris  = each.value.redirect_uris
  type           = each.value.type
}
