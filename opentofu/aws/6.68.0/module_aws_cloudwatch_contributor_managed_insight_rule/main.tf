resource "aws_cloudwatch_contributor_managed_insight_rule" "cloudwatch_contributor_managed_insight_rules" {
  for_each = var.cloudwatch_contributor_managed_insight_rules

  resource_arn  = each.value.resource_arn
  template_name = each.value.template_name
  region        = each.value.region
  state         = each.value.state
  tags          = each.value.tags
}
