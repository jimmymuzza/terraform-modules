resource "aws_iam_role_policy_attachment" "iam_role_policy_attachments" {
  for_each = var.iam_role_policy_attachments

  policy_arn = each.value.policy_arn
  role       = each.value.role
}
