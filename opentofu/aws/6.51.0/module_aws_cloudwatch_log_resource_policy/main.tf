resource "aws_cloudwatch_log_resource_policy" "cloudwatch_log_resource_policies" {
  for_each = var.cloudwatch_log_resource_policies

  policy_document = each.value.policy_document
  policy_name     = each.value.policy_name
  region          = each.value.region
  resource_arn    = each.value.resource_arn
}
