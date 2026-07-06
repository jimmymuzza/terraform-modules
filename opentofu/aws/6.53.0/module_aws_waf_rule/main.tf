resource "aws_waf_rule" "waf_rules" {
  for_each = var.waf_rules

  metric_name = each.value.metric_name
  name        = each.value.name
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
