resource "azurerm_gallery_application" "gallery_applications" {
  for_each = var.gallery_applications

  gallery_id            = each.value.gallery_id
  location              = each.value.location
  name                  = each.value.name
  supported_os_type     = each.value.supported_os_type
  description           = each.value.description
  end_of_life_date      = each.value.end_of_life_date
  eula                  = each.value.eula
  privacy_statement_uri = each.value.privacy_statement_uri
  release_note_uri      = each.value.release_note_uri
  tags                  = each.value.tags
}
