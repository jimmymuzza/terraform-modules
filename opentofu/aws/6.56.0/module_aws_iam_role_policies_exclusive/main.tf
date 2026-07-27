resource "aws_iam_role_policies_exclusive" "iam_role_policies_exclusives" {
  for_each = var.iam_role_policies_exclusives

  policy_names = each.value.policy_names
  role_name    = each.value.role_name
}
