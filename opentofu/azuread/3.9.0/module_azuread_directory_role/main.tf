resource "azuread_directory_role" "directory_roles" {
  for_each = var.directory_roles

  display_name = each.value.display_name
  template_id  = each.value.template_id
}
