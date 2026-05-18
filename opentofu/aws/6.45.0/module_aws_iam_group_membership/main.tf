resource "aws_iam_group_membership" "iam_group_memberships" {
  for_each = var.iam_group_memberships

  group = each.value.group
  name  = each.value.name
  users = each.value.users
}
