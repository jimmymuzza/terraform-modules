resource "azuread_directory_role_member" "directory_role_members" {
  for_each = var.directory_role_members

  member_object_id = each.value.member_object_id
  role_object_id   = each.value.role_object_id
}
