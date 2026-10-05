resource "aws_iam_group_policy" "iam_group_policies" {
  for_each = var.iam_group_policies

  group       = each.value.group
  policy      = each.value.policy
  name        = each.value.name
  name_prefix = each.value.name_prefix
}
