resource "aws_wafregional_rule" "wafregional_rules" {
  for_each = var.wafregional_rules

  metric_name = each.value.metric_name
  name        = each.value.name
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
