resource "aws_quicksight_iam_policy_assignment" "quicksight_iam_policy_assignments" {
  for_each = var.quicksight_iam_policy_assignments

  assignment_name   = each.value.assignment_name
  assignment_status = each.value.assignment_status
  aws_account_id    = each.value.aws_account_id
  namespace         = each.value.namespace
  policy_arn        = each.value.policy_arn
  region            = each.value.region

  dynamic "identities" {
    for_each = each.value.identities != null ? each.value.identities : []
    content {
      group = identities.value.group
      user  = identities.value.user
    }
  }
}
