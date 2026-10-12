resource "azuread_access_package" "access_packages" {
  for_each = var.access_packages

  catalog_id   = each.value.catalog_id
  description  = each.value.description
  display_name = each.value.display_name
  hidden       = each.value.hidden
}
