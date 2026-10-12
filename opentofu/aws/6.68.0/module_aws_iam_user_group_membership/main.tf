resource "aws_iam_user_group_membership" "iam_user_group_memberships" {
  for_each = var.iam_user_group_memberships

  groups = each.value.groups
  user   = each.value.user
}
