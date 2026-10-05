resource "aws_redshiftserverless_usage_limit" "redshiftserverless_usage_limits" {
  for_each = var.redshiftserverless_usage_limits

  amount        = each.value.amount
  resource_arn  = each.value.resource_arn
  usage_type    = each.value.usage_type
  breach_action = each.value.breach_action
  period        = each.value.period
  region        = each.value.region
}
