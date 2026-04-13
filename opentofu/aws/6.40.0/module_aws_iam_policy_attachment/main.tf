resource "aws_iam_policy_attachment" "iam_policy_attachments" {
  for_each = var.iam_policy_attachments

  name       = each.value.name
  policy_arn = each.value.policy_arn
  groups     = each.value.groups
  roles      = each.value.roles
  users      = each.value.users
}
