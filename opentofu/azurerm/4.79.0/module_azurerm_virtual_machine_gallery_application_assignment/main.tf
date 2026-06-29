resource "azurerm_virtual_machine_gallery_application_assignment" "virtual_machine_gallery_application_assignments" {
  for_each = var.virtual_machine_gallery_application_assignments

  gallery_application_version_id = each.value.gallery_application_version_id
  virtual_machine_id             = each.value.virtual_machine_id
  configuration_blob_uri         = each.value.configuration_blob_uri
  order                          = each.value.order
  tag                            = each.value.tag
}
