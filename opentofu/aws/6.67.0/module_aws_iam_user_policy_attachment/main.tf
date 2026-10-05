resource "aws_iam_user_policy_attachment" "iam_user_policy_attachments" {
  for_each = var.iam_user_policy_attachments

  policy_arn = each.value.policy_arn
  user       = each.value.user
}
