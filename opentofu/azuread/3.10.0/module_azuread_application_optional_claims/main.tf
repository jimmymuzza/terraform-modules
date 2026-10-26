resource "azuread_application_optional_claims" "application_optional_claims" {
  for_each = var.application_optional_claims

  application_id = each.value.application_id

  dynamic "access_token" {
    for_each = each.value.access_token != null ? each.value.access_token : []
    content {
      name                  = access_token.value.name
      additional_properties = access_token.value.additional_properties
      essential             = access_token.value.essential
      source                = access_token.value.source
    }
  }

  dynamic "id_token" {
    for_each = each.value.id_token != null ? each.value.id_token : []
    content {
      name                  = id_token.value.name
      additional_properties = id_token.value.additional_properties
      essential             = id_token.value.essential
      source                = id_token.value.source
    }
  }

  dynamic "saml2_token" {
    for_each = each.value.saml2_token != null ? each.value.saml2_token : []
    content {
      name                  = saml2_token.value.name
      additional_properties = saml2_token.value.additional_properties
      essential             = saml2_token.value.essential
      source                = saml2_token.value.source
    }
  }
}
