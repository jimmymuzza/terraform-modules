resource "aws_waf_rate_based_rule" "waf_rate_based_rules" {
  for_each = var.waf_rate_based_rules

  metric_name = each.value.metric_name
  name        = each.value.name
  rate_key    = each.value.rate_key
  rate_limit  = each.value.rate_limit
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "predicates" {
    for_each = each.value.predicates != null ? each.value.predicates : []
    content {
      data_id = predicates.value.data_id
      negated = predicates.value.negated
      type    = predicates.value.type
    }
  }
}
