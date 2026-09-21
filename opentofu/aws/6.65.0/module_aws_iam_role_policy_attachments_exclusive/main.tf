resource "aws_iam_role_policy_attachments_exclusive" "iam_role_policy_attachments_exclusives" {
  for_each = var.iam_role_policy_attachments_exclusives

  policy_arns = each.value.policy_arns
  role_name   = each.value.role_name
}
