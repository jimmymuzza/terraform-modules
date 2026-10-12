resource "aws_cloudwatch_log_account_policy" "cloudwatch_log_account_policies" {
  for_each = var.cloudwatch_log_account_policies

  policy_document    = each.value.policy_document
  policy_name        = each.value.policy_name
  policy_type        = each.value.policy_type
  region             = each.value.region
  scope              = each.value.scope
  selection_criteria = each.value.selection_criteria
}
