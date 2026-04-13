resource "aws_cloudwatch_contributor_insight_rule" "cloudwatch_contributor_insight_rules" {
  for_each = var.cloudwatch_contributor_insight_rules

  rule_definition = each.value.rule_definition
  rule_name       = each.value.rule_name
  region          = each.value.region
  rule_state      = each.value.rule_state
  tags            = each.value.tags
}
