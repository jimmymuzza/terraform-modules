resource "aws_quicksight_group_membership" "quicksight_group_memberships" {
  for_each = var.quicksight_group_memberships

  group_name     = each.value.group_name
  member_name    = each.value.member_name
  aws_account_id = each.value.aws_account_id
  namespace      = each.value.namespace
  region         = each.value.region
}
