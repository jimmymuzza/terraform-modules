resource "aws_iam_user_policy" "iam_user_policies" {
  for_each = var.iam_user_policies

  policy      = each.value.policy
  user        = each.value.user
  name        = each.value.name
  name_prefix = each.value.name_prefix
}
