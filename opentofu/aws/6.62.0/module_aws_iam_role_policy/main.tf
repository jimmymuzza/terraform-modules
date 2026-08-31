resource "aws_iam_role_policy" "iam_role_policies" {
  for_each = var.iam_role_policies

  policy      = each.value.policy
  role        = each.value.role
  name        = each.value.name
  name_prefix = each.value.name_prefix
}
