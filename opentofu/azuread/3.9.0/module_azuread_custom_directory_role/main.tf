resource "azuread_custom_directory_role" "custom_directory_roles" {
  for_each = var.custom_directory_roles

  display_name = each.value.display_name
  enabled      = each.value.enabled
  version      = each.value.version
  description  = each.value.description
  template_id  = each.value.template_id

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      allowed_resource_actions = permissions.value.allowed_resource_actions
    }
  }
}
