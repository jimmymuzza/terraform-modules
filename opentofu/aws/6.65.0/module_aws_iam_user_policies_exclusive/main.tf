resource "aws_iam_user_policies_exclusive" "iam_user_policies_exclusives" {
  for_each = var.iam_user_policies_exclusives

  policy_names = each.value.policy_names
  user_name    = each.value.user_name
}
