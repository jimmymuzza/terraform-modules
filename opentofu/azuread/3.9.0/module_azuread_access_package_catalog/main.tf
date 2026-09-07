resource "azuread_access_package_catalog" "access_package_catalogs" {
  for_each = var.access_package_catalogs

  description        = each.value.description
  display_name       = each.value.display_name
  externally_visible = each.value.externally_visible
  published          = each.value.published
}
