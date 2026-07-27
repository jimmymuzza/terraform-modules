resource "azuread_app_role_assignment" "app_role_assignments" {
  for_each = var.app_role_assignments

  app_role_id         = each.value.app_role_id
  principal_object_id = each.value.principal_object_id
  resource_object_id  = each.value.resource_object_id
}
