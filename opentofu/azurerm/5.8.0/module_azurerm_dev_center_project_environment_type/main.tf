resource "azurerm_dev_center_project_environment_type" "dev_center_project_environment_types" {
  for_each = var.dev_center_project_environment_types

  deployment_target_id          = each.value.deployment_target_id
  dev_center_project_id         = each.value.dev_center_project_id
  location                      = each.value.location
  name                          = each.value.name
  creator_role_assignment_roles = each.value.creator_role_assignment_roles
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "user_role_assignment" {
    for_each = each.value.user_role_assignment != null ? each.value.user_role_assignment : []
    content {
      roles   = user_role_assignment.value.roles
      user_id = user_role_assignment.value.user_id
    }
  }
}
