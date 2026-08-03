resource "aws_wafv2_regex_pattern_set" "wafv2_regex_pattern_sets" {
  for_each = var.wafv2_regex_pattern_sets

  scope       = each.value.scope
  description = each.value.description
  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "regular_expression" {
    for_each = each.value.regular_expression != null ? each.value.regular_expression : []
    content {
      regex_string = regular_expression.value.regex_string
    }
  }
}
