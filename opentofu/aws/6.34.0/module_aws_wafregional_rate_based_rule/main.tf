resource "aws_wafregional_rate_based_rule" "wafregional_rate_based_rules" {
  for_each = var.wafregional_rate_based_rules

  metric_name = each.value.metric_name
  name        = each.value.name
  rate_key    = each.value.rate_key
  rate_limit  = each.value.rate_limit
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "predicate" {
    for_each = each.value.predicate != null ? each.value.predicate : []
    content {
      data_id = predicate.value.data_id
      negated = predicate.value.negated
      type    = predicate.value.type
    }
  }
}
