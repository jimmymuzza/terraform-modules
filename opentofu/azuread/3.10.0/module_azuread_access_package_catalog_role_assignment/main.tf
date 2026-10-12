resource "azuread_access_package_catalog_role_assignment" "access_package_catalog_role_assignments" {
  for_each = var.access_package_catalog_role_assignments

  catalog_id          = each.value.catalog_id
  principal_object_id = each.value.principal_object_id
  role_id             = each.value.role_id
}
