resource "aws_iam_user_policy_attachments_exclusive" "iam_user_policy_attachments_exclusives" {
  for_each = var.iam_user_policy_attachments_exclusives

  policy_arns = each.value.policy_arns
  user_name   = each.value.user_name
}
