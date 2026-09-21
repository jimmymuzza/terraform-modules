resource "aws_cloudwatch_log_index_policy" "cloudwatch_log_index_policies" {
  for_each = var.cloudwatch_log_index_policies

  log_group_name  = each.value.log_group_name
  policy_document = each.value.policy_document
  region          = each.value.region
}
