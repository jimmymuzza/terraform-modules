resource "aws_iam_group_policy_attachment" "iam_group_policy_attachments" {
  for_each = var.iam_group_policy_attachments

  group      = each.value.group
  policy_arn = each.value.policy_arn
}
