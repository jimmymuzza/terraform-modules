resource "aws_iam_group_policies_exclusive" "iam_group_policies_exclusives" {
  for_each = var.iam_group_policies_exclusives

  group_name   = each.value.group_name
  policy_names = each.value.policy_names
}
