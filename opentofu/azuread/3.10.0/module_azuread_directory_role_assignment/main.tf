resource "azuread_directory_role_assignment" "directory_role_assignments" {
  for_each = var.directory_role_assignments

  principal_object_id = each.value.principal_object_id
  role_id             = each.value.role_id
  app_scope_id        = each.value.app_scope_id
  directory_scope_id  = each.value.directory_scope_id
}
