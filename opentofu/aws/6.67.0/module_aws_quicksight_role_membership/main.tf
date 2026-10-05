resource "aws_quicksight_role_membership" "quicksight_role_memberships" {
  for_each = var.quicksight_role_memberships

  member_name    = each.value.member_name
  role           = each.value.role
  aws_account_id = each.value.aws_account_id
  namespace      = each.value.namespace
  region         = each.value.region
}
