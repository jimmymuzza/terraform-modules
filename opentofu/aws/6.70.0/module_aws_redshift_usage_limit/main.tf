resource "aws_redshift_usage_limit" "redshift_usage_limits" {
  for_each = var.redshift_usage_limits

  amount             = each.value.amount
  cluster_identifier = each.value.cluster_identifier
  feature_type       = each.value.feature_type
  limit_type         = each.value.limit_type
  breach_action      = each.value.breach_action
  period             = each.value.period
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
