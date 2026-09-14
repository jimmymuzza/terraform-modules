resource "aws_iam_group_policy_attachments_exclusive" "iam_group_policy_attachments_exclusives" {
  for_each = var.iam_group_policy_attachments_exclusives

  group_name  = each.value.group_name
  policy_arns = each.value.policy_arns
}
