resource "aws_rolesanywhere_profile" "rolesanywhere_profiles" {
  for_each = var.rolesanywhere_profiles

  name                        = each.value.name
  accept_role_session_name    = each.value.accept_role_session_name
  duration_seconds            = each.value.duration_seconds
  enabled                     = each.value.enabled
  managed_policy_arns         = each.value.managed_policy_arns
  require_instance_properties = each.value.require_instance_properties
  role_arns                   = each.value.role_arns
  session_policy              = each.value.session_policy
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
