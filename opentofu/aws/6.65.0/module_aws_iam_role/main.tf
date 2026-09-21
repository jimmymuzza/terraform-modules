resource "aws_iam_role" "iam_roles" {
  for_each = var.iam_roles

  assume_role_policy    = each.value.assume_role_policy
  description           = each.value.description
  force_detach_policies = each.value.force_detach_policies
  managed_policy_arns   = each.value.managed_policy_arns
  max_session_duration  = each.value.max_session_duration
  name                  = each.value.name
  name_prefix           = each.value.name_prefix
  path                  = each.value.path
  permissions_boundary  = each.value.permissions_boundary
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "inline_policy" {
    for_each = each.value.inline_policy != null ? each.value.inline_policy : []
    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy
    }
  }
}
